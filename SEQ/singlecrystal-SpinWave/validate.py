#!/usr/bin/env python

import numpy as np
import histogram.hdf as hh

I = hh.load('slice_H00.h5').I
# expected_I = hh.load('expected_slice_H00.h5').I

# diff = np.abs(I-expected_I)
# assert (diff < np.max(expected_I)*.1).all()
