#!/usr/bin/env python

import os
here = os.path.dirname(__file__)
os.chdir(here)

def test():
    if os.system("NCOUNT=8e5 NODES=8 BUFFER_SIZE=100000 ./sim.sh"):
        raise RuntimeError("Failed")
    return

if __name__ == '__main__': test()
