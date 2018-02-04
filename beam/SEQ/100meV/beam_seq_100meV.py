#!/usr/bin/env python

import os
here = os.path.dirname(__file__) or os.curdir
os.chdir(here)

def test():
    if os.system("bash sim.sh"):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
