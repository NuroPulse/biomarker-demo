"""NuroPulse DSP v0.2 reference implementation (SciPy).

Source of truth for filter design and expected feature values (CLAUDE.md
section 7). The Dart pipeline in lib/dsp/ must match these numbers within
the golden-test tolerance, so keep the stage order and constants identical.
"""

import numpy as np
from scipy import signal

GRID_FS = 100.0  # uniform grid before the anti-alias low-pass
TARGET_FS = 50.0  # after decimating by 2
AA_CUTOFF_HZ = 20.0
AA_ORDER = 4  # TODO(calibrate): no source for the anti-alias filter order
BP_BAND_HZ = (1.0, 20.0)
BP_ORDER = 2
DROP_EDGE_S = 3.0
SEG_S = 4.0
NFFT = 256
PEAK_RANGE_HZ = (3.0, 12.0)
TREMOR_BAND_HZ = (3.5, 7.0)
RATIO_BAND_HZ = (1.0, 15.0)


def qc_sampling(t_us):
    """Effective rate, jitter and max gap from the real sensor timestamps."""
    dt_s = np.diff(t_us) / 1e6
    if len(dt_s) == 0 or np.any(dt_s <= 0):
        raise ValueError("timestamps must be strictly increasing")
    return {
        "effectiveFsHz": len(dt_s) / dt_s.sum(),
        "jitter": dt_s.std() / dt_s.mean(),
        "maxGapMs": dt_s.max() * 1000.0,
    }


def resample_to_target(t_us, x):
    """Linear interpolation to a uniform grid, anti-alias low-pass, decimate."""
    t_s = (t_us - t_us[0]) / 1e6
    grid = np.arange(0.0, t_s[-1], 1.0 / GRID_FS)
    y = np.interp(grid, t_s, x)
    aa = signal.butter(AA_ORDER, AA_CUTOFF_HZ, btype="low", fs=GRID_FS, output="sos")
    y = signal.sosfiltfilt(aa, y)
    return y[:: int(round(GRID_FS / TARGET_FS))]


def bandpass_sos():
    # Designed here, exported to dsp_config.json. Dart only applies it.
    return signal.butter(BP_ORDER, BP_BAND_HZ, btype="band", fs=TARGET_FS, output="sos")


def preprocess_axis(t_us, x):
    y = resample_to_target(t_us, x)
    y = y - y.mean()
    y = signal.sosfiltfilt(bandpass_sos(), y)
    # The first seconds carry the filter transient and the post-countdown tap.
    return y[int(DROP_EDGE_S * TARGET_FS):]


def welch_psd(x):
    seg = int(SEG_S * TARGET_FS)
    return signal.welch(
        x,
        fs=TARGET_FS,
        window="hann",
        nperseg=seg,
        noverlap=seg // 2,
        nfft=NFFT,
        detrend="constant",
        scaling="density",
        average="mean",
    )


def _band(f, lo_hi):
    return (f >= lo_hi[0]) & (f <= lo_hi[1])


def _peak(f, psd):
    """Argmax in the peak-search range with parabolic interpolation."""
    idx = np.flatnonzero(_band(f, PEAK_RANGE_HZ))
    k = idx[np.argmax(psd[idx])]
    delta = 0.0
    if 0 < k < len(psd) - 1:
        a, b, c = psd[k - 1], psd[k], psd[k + 1]
        denom = a - 2.0 * b + c
        if denom != 0.0:
            delta = 0.5 * (a - c) / denom
    return f[k] + delta * (f[1] - f[0]), k


def segment_consistency(processed_axes):
    """Fraction of Welch segments whose own peak falls in the tremor band."""
    seg = int(SEG_S * TARGET_FS)
    step = seg // 2
    n = len(processed_axes[0])
    hits = []
    for start in range(0, n - seg + 1, step):
        psd_sum = 0.0
        for x in processed_axes:
            f, p = signal.welch(
                x[start : start + seg],
                fs=TARGET_FS,
                window="hann",
                nperseg=seg,
                noverlap=0,
                nfft=NFFT,
                detrend="constant",
                scaling="density",
            )
            psd_sum = psd_sum + p
        peak_hz, _ = _peak(f, psd_sum)
        hits.append(TREMOR_BAND_HZ[0] <= peak_hz <= TREMOR_BAND_HZ[1])
    return float(np.mean(hits))


def analyze(t_us, axes):
    """Run the pipeline on one session. axes is a sequence of three arrays."""
    t_us = np.asarray(t_us, dtype=np.int64)
    qc = qc_sampling(t_us)
    processed = [preprocess_axis(t_us, np.asarray(a, dtype=float)) for a in axes]

    psd = 0.0
    for x in processed:
        f, p = welch_psd(x)
        psd = psd + p  # sum per-axis PSDs, never the vector magnitude

    peak_hz, k = _peak(f, psd)
    ratio_mask = _band(f, RATIO_BAND_HZ)
    tremor_mask = _band(f, TREMOR_BAND_HZ)
    ratio_power = np.trapezoid(psd[ratio_mask], f[ratio_mask])
    tremor_power = np.trapezoid(psd[tremor_mask], f[tremor_mask])

    features = {
        "peakFrequencyHz": peak_hz,
        "bandPowerRatio": tremor_power / ratio_power,
        "snr": psd[k] / np.median(psd[ratio_mask]),
        "bandRms": np.sqrt(tremor_power),
        "consistency": segment_consistency(processed),
    }
    return {"qc": qc, "features": {key: float(v) for key, v in features.items()}}
