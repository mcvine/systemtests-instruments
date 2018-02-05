#!/usr/bin/env python

import numpy as np, os, sys
import histogram.hdf as hh

expected_results_dir = os.path.abspath(os.path.dirname(__file__))

I = hh.load('slice_H00.h5').I
expected_I = hh.load(os.path.join(expected_results_dir, 'expected-slice_H00.h5')).I

mask = expected_I == expected_I
max = np.nanmax(expected_I)
epsilon = max * 1e-6

expected_has_signal = mask * (expected_I>epsilon)
has_signal = mask * (I>epsilon) * (I>0)

diff = np.logical_xor(expected_has_signal, has_signal).sum()
assert diff < 0.1 * mask.sum()

