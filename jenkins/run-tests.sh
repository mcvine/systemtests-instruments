#!/usr/bin/env bash

set -e

echo "System testing of instruments"

export PATH=$HOME/mc/bin:$PATH
source activate testenv

conda remove mcvine    # remove old installations
conda install -c mcvine/label/unstable mcvine

export AWS_S3_PROFILE_NAME=ndav_mcvine
py.test -s
# python SEQ/singlecrystal-SpinWave/test_singlecrystal_SpinWave.py
