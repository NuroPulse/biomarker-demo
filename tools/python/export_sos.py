"""Print the second-order-section coefficients for dsp_config.json.

Run from tools/python/: python export_sos.py
Filter design happens only here. Dart applies the coefficients as given.
"""

import json

from nuropulse_reference import AA_CUTOFF_HZ, AA_ORDER, BP_BAND_HZ, BP_ORDER, GRID_FS, TARGET_FS, bandpass_sos
from scipy import signal


def main():
    aa = signal.butter(AA_ORDER, AA_CUTOFF_HZ, btype="low", fs=GRID_FS, output="sos")
    payload = {
        "antiAliasLowpass": {
            "fsHz": GRID_FS,
            "orderRequested": AA_ORDER,
            "sos": aa.tolist(),
        },
        "bandpass": {
            "fsHz": TARGET_FS,
            "bandHz": list(BP_BAND_HZ),
            "orderRequested": BP_ORDER,
            "sos": bandpass_sos().tolist(),
        },
    }
    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
