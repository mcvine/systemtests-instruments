#!/usr/bin/env python

import os
here = os.path.dirname(__file__) or '.'
here = os.path.abspath(here)

scattered = os.path.join(here, '../sample/out/scattered.mcvine')

from mcni.neutron_storage.idf_usenumpy import count
N = count(scattered)

from mcvine import run_script
run_script.run_mpi('./sd.py', 'out', ncount=N, nodes=8, overwrite_datafiles=True)
