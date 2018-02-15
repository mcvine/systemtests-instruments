#!/usr/bin/env bash

echo "System testing of instruments"

export PATH=$HOME/mc/bin:$PATH
source activate testenv

conda remove mcvine-core    # remove old installations
rm -rf $HOME/mc/pkgs/mcvine*


set -e
conda config --add channels mantid  # need mantid-framework
conda install -c mcvine/label/unstable mcvine
conda list mcvine

export AWS_S3_PROFILE_NAME=ndav_mcvine
py.test -s
# python SEQ/singlecrystal-SpinWave/test_singlecrystal_SpinWave.py
# python SEQ/powder-V/test_seq_powder_V.py
