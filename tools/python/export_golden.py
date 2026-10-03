"""Export golden cases to test/dsp/golden/*.json (CLAUDE.md section 10).

Run from tools/python/: python export_golden.py
Inputs are rounded before analysis, so the expected values are computed on
exactly the numbers the Dart test will read back from the JSON file.
"""

import json
import pathlib

import numpy as np

from nuropulse_reference import analyze
from synth_signal import make_session

OUT_DIR = pathlib.Path(__file__).resolve().parents[2] / "test" / "dsp" / "golden"

CASES = {
    "tremor_5hz": dict(duration_s=25, freq_hz=5.0, amp=0.05, noise_sd=0.02, seed=1),
    "tremor_9hz": dict(duration_s=25, freq_hz=9.0, amp=0.05, noise_sd=0.02, seed=2),
    "rest_noise": dict(duration_s=25, noise_sd=0.02, seed=3),
}

# Starting tolerances. TODO(calibrate): revisit after the first Dart run.
# The frequency tolerance is a quarter of the 0.195 Hz Welch bin width.
TOLERANCE = {"peakFrequencyHz_abs": 0.05, "relative": 0.02}


def export_case(name, params):
    t_us, axes = make_session(**params)
    t_us = t_us.tolist()
    axes = [np.round(a, 6).tolist() for a in axes]
    result = analyze(t_us, axes)

    payload = {
        "name": name,
        "synthetic": True,
        "requestedPeriodUs": 10000,
        "input": {"t_us": t_us, "x": axes[0], "y": axes[1], "z": axes[2]},
        "expected": result,
        "tolerance": TOLERANCE,
    }
    path = OUT_DIR / f"{name}.json"
    path.write_text(json.dumps(payload), encoding="utf-8")
    print(f"{name}: {result['features']} -> {path.name}")


if __name__ == "__main__":
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for case_name, case_params in CASES.items():
        export_case(case_name, case_params)
