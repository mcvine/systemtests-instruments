#!/usr/bin/env python

from mcvine import run_script
run_script.run_mpi('./sss.py', 'out', ncount=8e6, nodes=8, overwrite_datafiles=True)
