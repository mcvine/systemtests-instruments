#!/usr/bin/env python

import os, subprocess as sp, shlex

def test():
    here = os.path.dirname(__file__)
    print here
    os.chdir(here)
    cmd = 'NCOUNT=8e5 NODES=8 BUFFER_SIZE=100000 QAXIS="0 8 0.05" ./sim.sh'
    if os.system(cmd):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()