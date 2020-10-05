#!/bin/bash

set -x
set -e
export PATH=$HOME/mc/bin:$PATH
conda create -n test python=$PYTHON_VERSION
source activate test
conda install -c mcvine/label/unstable mcvine=1.4 pytest awscli
conda list mcvine
conda list mcvine-core
THIS_SCRIPT_DIR=`dirname $0`
python $THIS_SCRIPT_DIR/init_mantid_user_config.py
