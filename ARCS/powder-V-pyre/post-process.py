#!/usr/bin/env python

import os, shutil
import histogram.hdf as hh

# get I(Q,E)
# os.system('mcvine mantid extract_iqe mysim/iqe.nxs ieq.h5')
# ieq = hh.load('ieq.h5')
# iqe = ieq.transpose()
# hh.dump(iqe, 'iqe.h5')
shutil.copyfile('mysim/iqe.h5', 'iqe.h5')
iqe = hh.load('iqe.h5')

# get I(E)
iqe.I[iqe.I!=iqe.I] = 0
ie = iqe.sum('Q')
hh.dump(ie, 'ie.h5')
