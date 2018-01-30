#!/bin/bash

set -e
mcvine instruments arcs beam -E=100 -ncount=1e4 -nodes=4
rm -rf _m2sout
mkdir -p ~/beam/ARCS/100meV-n1e4
rm -rf ~/beam/ARCS/100meV-n1e4/*
mv * ~/beam/ARCS/100meV-n1e4/
