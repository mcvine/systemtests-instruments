#!/usr/bin/env python

import os, subprocess as sp, shlex

def test():
    here = os.path.dirname(__file__) or '.'
    print(here)
    os.chdir(here)
    cmd = 'mcvine instruments hyspec beam -E=20 --ncount=8e6 --nodes=8'
    if os.system(cmd):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
