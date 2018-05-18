#!/usr/bin/env bash

set -e

# beam
cd beam; ./run.py; cd ..

# scattering
cd sample; ./run.py; cd ..

# detector
cd detector; ./run.sh; cd ..
