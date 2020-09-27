#!/bin/bash

set -x
set -e
export PATH=$HOME/mc/bin:$PATH
conda create -n test python=$PYTHON_VERSION
source activate test
conda install -c mcvine/label/unstable mcvine pytest awscli
conda list mcvine
conda list mcvine-core
