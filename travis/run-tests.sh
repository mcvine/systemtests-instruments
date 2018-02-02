#!/usr/bin/env bash

set -e

echo "System testing of sample assemblies"

source activate testenv

conda install -c mcvine/label/unstable mcvine mcvine.workflow mcvine.phonon
py.test -s
