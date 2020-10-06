#!/usr/bin/env python

import os, subprocess as sp, shlex

def test():
    here = os.path.dirname(__file__) or '.'
    print(here)
    os.chdir(here)
    cmd = "bash run.sh"
    if os.system(cmd):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
