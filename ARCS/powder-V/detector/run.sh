./run.py
mcvine instruments arcs events2nxs --tofbinsize 1. --type raw --Ei=100 out/arcs.dat arcs-sim.nxs
mcvine instruments arcs nxs reduce --out iqe.nxs --use_ei_guess --ei_guess 100  --qaxis 0 12 0.1  --eaxis -50 100 1. --tof2E arcs-sim.nxs
