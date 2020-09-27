#!/usr/bin/env python

import os, subprocess as sp, shlex, testutils

def test():
    here = os.path.dirname(__file__)
    os.chdir(here)
    cmd = './sim.sh'
    testutils.execute(cmd)
    return

if __name__ == '__main__': test()
