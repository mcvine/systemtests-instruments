#!/usr/bin/env python

import os, shutil
import histogram.hdf as hh

ie = hh.load('ie.h5').I
ie0 = hh.load('expected-ie.h5').I

diff = np.abs(ie-ie0)
assert (diff < np.max(ie0)*.1).all()
