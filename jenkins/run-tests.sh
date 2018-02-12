#!/usr/bin/env bash

set -e

echo "System testing of instruments"

export PATH=$HOME/mc/bin:$PATH
source activate testenv

# with conda build of mantid 3.11, the virtual instrument definition
# does not work yet. use mantid 3.10 for now
conda install -c mantid mantid-framework=3.10

conda remove mcvine    # remove old installations
conda install -c mcvine/label/unstable mcvine-full

export AWS_S3_PROFILE_NAME=ndav_mcvine
py.test -s
# python SEQ/singlecrystal-SpinWave/test_singlecrystal_SpinWave.py
