#!/usr/bin/env python

import os, testutils, pytest, psutil

@pytest.mark.skipif(psutil.virtual_memory().free<33*1e9,
                    reason="not enough memory")
def test():
    here = os.path.dirname(__file__) or '.'
    print(here)
    os.chdir(here)
    env = dict(
        NCOUNT='8e5',
        NODES='8',
        BUFFER_SIZE='100000',
        QAXIS='0 8 0.05'
    )
    testutils.execute('./sim.sh', env)
    return

if __name__ == '__main__': test()
