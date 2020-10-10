#!/bin/bash

set -x
set -e
export PATH=$HOME/mc/bin:$PATH
source activate test

# get beam data
THIS_SCRIPT_DIR=`dirname $0`
$THIS_SCRIPT_DIR/getbeam.sh

# checking installation
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
which py.test
python -c "import mcvine"
mcvine

_SRC_=$PWD
cd ./SEQ/singlecrystal-SpinWave/single_psi \
    && make NCOUNT=1e6 BUFFER_SIZE=100000 NODES=5 SAMPLE_ANGLE=0 MS=0 \
    && cd $_SRC_ \
    && PYTHONPATH=$PWD py.test 
