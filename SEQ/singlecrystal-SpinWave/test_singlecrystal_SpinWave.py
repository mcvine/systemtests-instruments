#!/usr/bin/env python

import os, subprocess as sp, shlex

def test():
    here = os.path.dirname(__file__)
    os.chdir(here)
    cmd = './sim.sh'
    if os.system(cmd):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
