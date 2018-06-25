#!/usr/bin/env python

import os, subprocess as sp, shlex

def test():
    here = os.path.dirname(__file__) or '.'
    print here
    os.chdir(here)
    cmd = 'NCOUNT=8e7 NODES=8 BUFFER_SIZE=1000000 QAXIS="0 8 0.05" DETECTOR_VESSEL_ANGLE=0 ./sim.sh'
    if os.system(cmd):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
