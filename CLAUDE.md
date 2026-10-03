# CLAUDE.md — NuroPulse Biomarker Demo

Guidance for Claude Code (and any contributor) working in this repository. Read this fully before writing code. When a decision here changes, update this file in the same change.

Status: draft v0.1 (2026-10-03)

---

## 1. What this project is

A standalone Flutter app for testing the **feasibility of the NuroPulse tremor-analysis DSP pipeline on real phones**. It lives in its own repository, separate from the main NuroPulse mobile app.

Flow:

```
Press Start -> countdown -> record sensors -> process (DSP) -> show decision
                                                          -> show debug views + save raw signals
```

Goals:

- Record accelerometer and gyroscope data from a phone strapped to the back of the hand, with real sensor timestamps.
- Run the DSP pipeline on-device and show the decision plus every intermediate result needed for debugging (filtered signal, spectrum, features, quality-gate results).
- Save raw signals and metadata per session so the team can export them and calibrate thresholds offline in Python.

Non-goals:

- Not a production app, not a medical device, and never a diagnostic tool. The output is "rhythmic tremor detected / not detected / invalid measurement", never a diagnosis.
- No backend, no authentication, no network code (see Section 12).

The DSP code written here is expected to be copied into the main NuroPulse app later, once thresholds and the algorithm are stable. Keep `lib/dsp/` independent so that copy is trivial (Section 3).

---

## 2. Tech stack and decisions

| Area             | Decision                                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| Framework        | Flutter (stable channel), Dart null safety                                                                                                        |
| State management | `flutter_bloc` with **Cubit** (no Bloc events)                                                                                                    |
| State and models | `freezed` + `json_serializable` for Cubit states and data models                                                                                  |
| Local storage    | `hive_ce` + `hive_ce_flutter` (the original `hive` package is abandoned; do not use it)                                                           |
| Secure storage   | `flutter_secure_storage` is **deferred until auth exists**. Do not add it now. Keep storage behind repositories so encryption can be added later. |
| Sensors          | `sensors_plus`                                                                                                                                    |
| FFT              | `fftea`                                                                                                                                           |
| Routing          | `go_router`, configured in `services/router_service.dart`, `MaterialApp.router` in `app.dart`                                                     |
| Charts           | `CustomPainter` for the live waveform, `fl_chart` (with downsampling) for post-processing charts                                                  |
| Files and export | `path_provider`, `share_plus`                                                                                                                     |
| Screen           | `wakelock_plus` keeps the screen on while recording                                                                                               |
| Metadata         | `device_info_plus`, `package_info_plus`, `uuid`                                                                                                   |
| Logging          | `logger`, wrapped by `LoggerService`                                                                                                              |
| Testing          | `flutter_test`, `bloc_test`, `mocktail`                                                                                                           |
| Lints            | `flutter_lints`                                                                                                                                   |
| Platform         | Android first, tested on **physical devices only**. iOS later. Emulators have no trustworthy sensors.                                             |

Rules for dependencies:

- Do not pin versions from memory. Check the latest version on pub.dev when adding a package, and say which version you added.
- Do not add a dependency that is not in the table above without asking.
- DI is plain `RepositoryProvider` / `BlocProvider` wiring in `app.dart` and `main.dart`. Do not add a service locator (`get_it` etc.) unless asked.

---

## 3. Architecture and folder structure

Clean architecture, feature-based. Follow this layout exactly.

```
lib/
├── app.dart                        # Root MaterialApp.router, providers
├── main.dart                       # Entry point — init Hive, load DSP config, run app
│
├── core/
│   ├── errors/                     # Failure hierarchy (no Dio failures — no HTTP in this app)
│   ├── themes/                     # BaseColors, FontTheme
│   └── utils/                      # Date/time helpers, CSV helpers, number formatting
│
├── dsp/                            # PURE DART signal processing — see rules below
│   ├── _dsp.dart                   # Barrel: the only file the rest of the app imports
│   ├── dsp_config.dart
│   ├── tremor_pipeline.dart        # Orchestrates the stages
│   ├── models/                     # Pure result types: features, gate results, tremor result
│   └── stages/                     # resampler, sos_filter, welch, features, quality_gate, decision
│
├── features/
│   ├── measure/                    # Record -> process -> decision -> debug views
│   │   ├── data/
│   │   │   ├── datasources/        # SensorDatasource (sensors_plus) — _datasources.dart barrel
│   │   │   ├── models/             # _models.dart barrel (only if needed)
│   │   │   └── repositories/       # MeasureRepositoryImpl (runs DSP in an Isolate) — _repositories.dart barrel
│   │   ├── domain/
│   │   │   ├── entity/             # SensorSample, RecordedSignals (pure, no JSON, no annotations)
│   │   │   └── repositories/       # Abstract MeasureRepository — _repositories.dart barrel
│   │   └── presentation/
│   │       ├── cubit/              # MeasureCubit + Freezed MeasureState — _cubits.dart barrel
│   │       ├── pages/              # Screen widgets — _pages.dart barrel
│   │       └── widgets/            # LiveWaveform, SpectrumChart, FeatureTable, GateList, DecisionBanner — _widgets.dart barrel
│   │
│   └── sessions/                   # Saved sessions: list, detail, export, delete
│       ├── data/
│       │   ├── datasources/        # SessionLocalDatasource (Hive), SessionFileDatasource (CSV + meta.json) — _datasources.dart barrel
│       │   ├── models/             # SessionModel (Freezed + JSON) — _models.dart barrel
│       │   └── repositories/       # SessionRepositoryImpl — _repositories.dart barrel
│       ├── domain/
│       │   ├── entity/             # SessionEntity (pure)
│       │   └── repositories/       # Abstract SessionRepository — _repositories.dart barrel
│       └── presentation/
│           ├── cubit/              # SessionsCubit + Freezed state — _cubits.dart barrel
│           ├── pages/              # _pages.dart barrel
│           └── widgets/            # _widgets.dart barrel
│
└── services/
    ├── storage/                    # HiveService (sessions box + settings box). SecureKeyService only once auth exists.
    ├── logger_service.dart
    └── router_service.dart
```

The file names inside each feature above are illustrative; the folder structure and barrel names are not.

Not created in this app, on purpose: `core/client/`, `core/environments/`, `services/jwt_service.dart`, `flutter_dotenv`, anything with Dio or HTTP.

### Layer rules

- **presentation** depends on **domain** only (entities and repository interfaces). It never imports `data/`.
- **data** implements **domain** interfaces. Models (Freezed + JSON) live here and map to and from entities.
- **domain** is pure Dart: no Flutter imports, no JSON, no annotations, no Hive, no `sensors_plus` types.
- There is **no use-case layer** in this template. Cubits call repository interfaces directly. Do not add one.
- A feature may depend on another feature's **`domain/`** layer only (for example `measure` uses `SessionRepository` and `SessionEntity` from `sessions`). Never import another feature's `data/` or `presentation/`.
- Widgets contain no business logic. Anything beyond layout and event forwarding belongs in a Cubit.

### `lib/dsp/` rules (important)

- Files in `lib/dsp/` may import only `dart:*` and `package:fftea`. **No** imports from Flutter, `flutter_bloc`, Hive, or any other part of the app (`core/`, `features/`, `services/`).
- The rest of the app imports DSP only through `lib/dsp/_dsp.dart`.
- DSP result types in `lib/dsp/models/` may be used directly by `domain/` and `data/` layers; do not duplicate them as entities.
- All numbers (bands, thresholds, filter coefficients, segment lengths) come from `DspConfig`, loaded from `assets/config/dsp_config.json`. No magic numbers in stage code.
- DSP code is deterministic and has no I/O.

## 4. Coding standards

- `dart format` before every commit; `flutter analyze` must be clean.
- Use `const` constructors wherever possible. Prefer immutability: Freezed for states and models.
- Cubit states and data models are Freezed. Entities are plain immutable Dart classes with no annotations.
- One public class per file (small private helpers excepted). File names are `snake_case`, class names `PascalCase`.
- No `print`. Use `LoggerService`.
- No business logic in widgets. No `BuildContext` in Cubits, repositories, or DSP.
- Do not swallow errors. Catch at the repository boundary, convert to a `Failure`, and let the Cubit emit a failure state.
- Comments explain **why**, not what. Do not leave commented-out code.
- Keep functions short and named for what they do. Prefer early returns over deep nesting.
- Generated files (`*.freezed.dart`, `*.g.dart`) are committed or ignored consistently with `.gitignore`; never edit them by hand.

### Errors

- `core/errors/` defines a sealed `Failure` hierarchy: `SensorFailure`, `StorageFailure`, `AnalysisFailure`, `ExportFailure`.
- Repositories **throw** `Failure` subclasses (they implement `Exception`). Cubits catch `Failure` and emit a failure state.
- `Failure.message` is developer-facing English and is only logged. **Never display it.** The presentation layer maps each failure type to an Indonesian message.

---

## 5. Language rules

### User-facing text → Bahasa Indonesia

Anything rendered in the UI: labels, buttons, error messages shown to the user, toasts, snackbars, dialogs, form validation messages, chart titles and axis labels, empty states.

### Developer-facing text → English

Console logs, code comments, commit messages, internal error logs that are not shown to users, `Failure.message`, variable/class/function/file names, test names, and this file.

Never mix: no English strings in the UI, no Indonesian identifiers or comments in code.

Reusable UI strings should be defined once (a constants class in the feature's presentation layer), not repeated across widgets.

### Wording that must stay consistent

| Meaning                | Indonesian text                                        |
| ---------------------- | ------------------------------------------------------ |
| Start                  | Mulai                                                  |
| Cancel                 | Batal                                                  |
| Retry                  | Ulangi                                                 |
| Processing             | Memproses…                                             |
| Result                 | Hasil                                                  |
| Saved sessions         | Riwayat sesi                                           |
| Export                 | Ekspor                                                 |
| Delete                 | Hapus                                                  |
| Delete confirmation    | Hapus sesi ini?                                        |
| Countdown              | Bersiap… mulai dalam {n} detik                         |
| Recording              | Merekam… tahan tangan tetap rileks                     |
| Decision: none         | Tremor ritmis tidak terdeteksi.                        |
| Decision: tremor       | Tremor ritmis terdeteksi. Perlu evaluasi lebih lanjut. |
| Decision: invalid      | Pengukuran tidak valid. Silakan ulangi.                |
| Gate: sampling too low | Kecepatan sampling sensor terlalu rendah               |
| Gate: data gap         | Ada jeda data yang terlalu panjang                     |
| Gate: large movement   | Gerakan tangan terlalu besar                           |
| Gate: weak signal      | Sinyal terlalu lemah (di bawah noise sensor)           |
| Uncalibrated banner    | Ambang belum dikalibrasi                               |
| Interrupted            | Rekaman dihentikan karena aplikasi keluar dari layar.  |
| Generic error          | Terjadi kesalahan. Silakan coba lagi.                  |
| Export failed          | Gagal mengekspor sesi.                                 |

UI text must **never** say or imply a diagnosis (no "Parkinson", "sakit", "sehat"). Use the decision wording above.

---

## 6. Recording and storage

### Sensors

Record all three, simultaneously, in one session:

| File           | `sensors_plus` stream          | Content                                     |
| -------------- | ------------------------------ | ------------------------------------------- |
| `user_acc.csv` | `userAccelerometerEventStream` | Acceleration with gravity removed by the OS |
| `acc_raw.csv`  | `accelerometerEventStream`     | Raw acceleration including gravity          |
| `gyro.csv`     | `gyroscopeEventStream`         | Angular velocity                            |

- Request `samplingPeriod: Duration(milliseconds: 10)` (about 100 Hz). This is a request, not a guarantee: always compute the effective rate from timestamps.
- Store timestamps from `event.timestamp.microsecondsSinceEpoch` as `t_us`. Never substitute array index or `DateTime.now()`.
- The sensor streams in `sensors_plus` are shared: calling a stream method again with a different sampling period changes the period of existing listeners. Use one listener per sensor, all with the same period.
- Do not emit Cubit state per sensor sample (see Section 8).

### Session folder

Location: `<application documents directory>/sessions/<sessionId>/`

```
user_acc.csv
acc_raw.csv
gyro.csv
meta.json
```

CSV format (header required, one row per sample, values in the sensor's native units):

```
t_us,x,y,z
1790899200012345,0.021,-0.043,0.008
```

`meta.json` example:

```json
{
	"sessionId": "uuid-v4",
	"createdAt": "2026-10-03T10:15:00+07:00",
	"subjectCode": "S01",
	"hand": "right",
	"condition": "rest",
	"repetition": 1,
	"simulatedFrequencyHz": null,
	"notes": "",
	"device": { "model": "...", "os": "Android 14", "appVersion": "0.1.0" },
	"sampling": {
		"requestedPeriodUs": 10000,
		"effectiveFsHz": 98.7,
		"jitter": 0.21,
		"maxGapMs": 31
	},
	"algoVersion": "0.2.0-dev",
	"configSnapshot": {},
	"result": { "status": "tremor", "features": {}, "gates": [] }
}
```

- `condition` is one of: `rest`, `postural`, `noise_floor`, `simulated`.
- `subjectCode` is an anonymous code. **Never store names or any identifying information.**
- Sessions without labels are useless for calibration, so subject code, hand, and condition are required before Start.

### Hive

- Boxes (opened in `HiveService`): `sessions` (key = session id) and `settings`.
- Store **JSON maps** produced by the Freezed models. Do not use Hive TypeAdapters or `hive_ce_generator`.
- Hive holds session metadata, features, decision, and the folder path. **Raw signals never go into Hive**; they live in the CSV files.
- Hive is initialized in `main.dart` before `runApp`.

---

## 7. DSP specification (version 0.2, work in progress)

> Every number below is a **starting value** and none is validated for smartphones in this app. Values are designed to be changed through `dsp_config.json` after calibration. Do not present any of them as established evidence. If a parameter has no source, mark it `TODO(calibrate)` instead of inventing a reference.

### Protocol (shown to the user before recording)

- Phone strapped to the back of the hand (dorsum), seated, forearm supported, hand relaxed.
- Countdown 3 s, then record 20 s (`rest`). A 20 s `postural` recording (arm extended) is a separate session with `condition = postural`.
- Do not touch the screen while recording.
- **No vibration, haptics, or sound that moves the phone between recording start and stop.** Cues are allowed before and after only. Vibration contaminates the signal.

### Pipeline

```
QC sampling -> resample -> demean -> band-pass -> drop edge -> Welch per axis, summed
            -> features -> quality gate -> decision
```

1. **QC sampling.** Compute effective sampling rate and maximum gap from the real timestamps. Starting thresholds: effective rate >= 50 Hz, no gap > 200 ms. Failure produces `invalid`.
2. **Resample.** Linear interpolation on the real timestamps to a uniform grid. Starting plan: grid at 100 Hz, low-pass (about 20 Hz) for anti-aliasing, decimate to 50 Hz. The target rate is config-driven, not hardcoded. Guard against duplicate timestamps (zero time span).
3. **Demean**, then **band-pass 1–20 Hz**, Butterworth order 2, applied forward then backward (zero-phase).
   - **Do not design filters in Dart.** Generate second-order-section coefficients in Python with `scipy.signal.butter(..., output='sos')` for the exact sampling rate, export them into `dsp_config.json`, and implement only the filter application in Dart.
   - Edge handling will differ from SciPy's `sosfiltfilt`, which is why the edge is dropped next.
4. **Drop the first 3 s** after filtering (edge transient and settling after the countdown tap).
5. **Spectrum (Welch), per axis, then sum the per-axis PSDs.**
   - 4 s segments, 50% overlap, Hann window, nFFT 256.
   - Match `scipy.signal.welch` defaults (`detrend='constant'`, `scaling='density'`, mean averaging) so Dart and Python agree.
   - Sum PSD across axes. **Do not use the vector magnitude of a zero-mean signal**: rectification doubles the apparent frequency. Summing per-axis PSD also removes dependence on phone orientation.
6. **Features** (tremor band starts at 3.5–7 Hz):
   - `peakFrequencyHz`: argmax of the PSD in the peak-search range (starting 3–12 Hz), with parabolic interpolation.
   - `bandPowerRatio`: power in the tremor band divided by power in 1–15 Hz.
   - `snr`: PSD at the peak divided by the median PSD over 1–15 Hz.
   - `bandRms`: RMS amplitude within the tremor band.
   - `consistency`: fraction of Welch segments whose own peak lies in the tremor band.
   - Planned after the core passes its tests: rest/postural energy ratio (needs both recording types, can start offline in Python), spectral width / power dispersion, harmonic power.
7. **Quality gate.** Any failed check makes the result `invalid`, and the app asks for a repeat:
   - sampling rate and gap (step 1);
   - excessive voluntary movement (large low-frequency energy or RMS before band-pass);
   - clipping against the sensor's range;
   - signal below the noise floor (the per-model noise floor is measured with `condition = noise_floor`: phone lying still on a table for 60 s).
8. **Decision.** Rule-based and transparent. Exactly three statuses:
   - `none`: valid measurement, rule not met;
   - `tremor`: valid, peak inside the tremor band and the thresholds met;
   - `invalid`: a gate failed.
   - Thresholds in `dsp_config.json` carry a `"calibrated": false` flag. While false, the UI shows the "Ambang belum dikalibrasi" banner. The shipped placeholder values (for example SNR >= 4, band power ratio >= 0.3, consistency >= 0.6) come from the team's own illustration, not from the literature.

### What the DSP must never claim

- Frequency alone does not separate Parkinson's tremor from essential tremor or other tremors. The app never outputs a diagnosis or a disease name.

### Python reference

- `tools/python/` contains the reference notebook/scripts: synthetic signal generation, the same pipeline in SciPy, filter-coefficient export, and golden-test export.
- Python is the source of truth for filter design and for expected feature values.

---

## 8. Cubit specifics

`MeasureState` is a Freezed union:

```
idle | countdown(secondsLeft) | recording(elapsed, liveWindow) | processing
     | success(result, sessionId) | invalid(reasons) | failure(failure)
```

- State machine only moves forward through these states; `Ulangi` returns to `idle`.
- Sensor samples go into a plain in-memory buffer, not into state. Emit `recording` state at most about 10–15 times per second with a small downsampled window for the live waveform. A busy main thread distorts sensor event delivery.
- DSP runs off the UI isolate: `Isolate.run(() => TremorPipeline(config).analyze(signals))`. Convert samples to typed lists (`Float64List`) before sending.
- Cancel all sensor subscriptions in `close()`, and when the app leaves the foreground during recording (`AppLifecycleState.paused`), stop and emit `invalid` with the interruption message.
- Keep the screen awake with `wakelock_plus` for the duration of recording and release it afterwards.
- After a successful analysis, persist through `SessionRepository` (CSV files, `meta.json`, Hive entry) before emitting `success`.

---

## 9. Debug screens

After processing, the result page shows (all Indonesian labels):

- decision banner (and the uncalibrated-thresholds banner when applicable);
- signal before vs after filtering;
- spectrum with the tremor band highlighted;
- feature table (values with units);
- quality-gate list with pass/fail per check;
- session metadata (effective sampling rate, jitter, max gap, device).

The sessions page lists saved sessions, opens a detail view, and supports export (`share_plus`, the session folder's files) and delete (with confirmation).

---

## 10. Testing

- `dart test` / `flutter test` must pass before any change is considered done.
- **DSP unit tests** (`test/dsp/`): synthetic sines at known frequencies (peak within the Welch resolution of about 0.25 Hz), amplitude behavior, jittered timestamps, gap rejection, duplicate timestamps, all-zero signal (must be `invalid`, not `none`).
- **Golden tests**: Python exports input signals and expected features to `test/dsp/golden/*.json`; Dart must match within a stated tolerance. Compare only the region after the dropped edge.
- **Cubit tests** with `bloc_test` and `mocktail`: state sequence for success, invalid, failure, and interruption.
- No tests that depend on a real sensor.

---

## 11. Known unknowns (verify on a device, then record the answer here)

- Whether `event.timestamp` from `sensors_plus` is hardware sensor time or arrival time at Dart, and whether it differs between Android and iOS. Test by logging it next to `DateTime.now()` and comparing deltas.
- Whether Android 12+ requires the `HIGH_SAMPLING_RATE_SENSORS` permission to reach about 100 Hz on the target phones. Check the Android documentation and test on devices.
- Exact units of each stream (expected m/s² for accelerometers and rad/s for the gyroscope). Confirm in the package documentation and with a device at rest.
- Whether `userAccelerometer` (OS-side gravity removal) attenuates tremor compared with raw acceleration. This is why both are recorded.

---

## 12. Out of scope (do not add unless explicitly asked)

Supabase, Dio or any HTTP client, authentication, JWT, `flutter_dotenv`, `flutter_secure_storage`, analytics, push notifications, a use-case layer, a service locator, and localization frameworks.

---

## 13. Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # Freezed / JSON generated code
dart format .
flutter analyze
flutter test
flutter run                                                # on a physical device
```

Python tools (in `tools/python/`): `pip install numpy scipy pandas matplotlib`, then run the notebook or scripts there.

---

## 14. Working agreements

- Ask before adding a dependency, a new feature folder, or a new architectural layer.
- Never invent literature values, citations, or validation results. Unknown means `TODO(calibrate)` or an entry in Section 11.
- Keep `lib/dsp/` pure. If a change would make it import Flutter, Cubit, Hive, or any app code, stop and restructure.
- Follow the barrel-file pattern for every new file.
- UI strings in Bahasa Indonesia, everything developer-facing in English.
- Run `dart format`, `flutter analyze`, and `flutter test` before reporting work as done, and state what you ran.
- Commit messages: English, imperative mood, one logical change per commit.
