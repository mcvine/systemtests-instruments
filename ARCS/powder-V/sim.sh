#!/bin/bash

mcvine workflow powder --instrument=ARCS --sample=V --workdir=mysim
cd mysim
rm -rf beam
ln -s ~/beam/ARCS/100meV-n1e7 beam
make NCOUNT=1e7 NODES=4
