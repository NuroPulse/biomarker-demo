"""Synthetic sensor sessions for the DSP reference and golden tests.

Signals are synthetic. Amplitudes and noise levels are illustrative and do
not represent real tremor, so never cite them as evidence.
"""

import numpy as np

T0_US = 1790899200000000  # arbitrary epoch offset in microseconds


def make_session(
    duration_s,
    freq_hz=None,
    amp=0.0,
    noise_sd=0.02,
    nominal_period_us=10000,
    jitter_us=1000,
    seed=0,
):
    """Return (t_us, [x, y, z]) with jittered timestamps like a real sensor."""
    rng = np.random.default_rng(seed)
    n = int(duration_s * 1e6 / nominal_period_us) + 1
    dt = nominal_period_us + rng.integers(-jitter_us, jitter_us + 1, size=n - 1)
    t_us = T0_US + np.concatenate([[0], np.cumsum(dt)]).astype(np.int64)
    t_s = (t_us - t_us[0]) / 1e6

    tone = amp * np.sin(2 * np.pi * freq_hz * t_s) if freq_hz else np.zeros(n)
    axes = [
        weight * tone + noise_sd * rng.standard_normal(n)
        for weight in (0.8, 0.5, 0.3)
    ]
    return t_us, axes
