#!/usr/bin/env bash

echo "System testing of instruments"

set -x

# remove old downloads
rm -rf $HOME/mc/pkgs/mcvine*
sleep 5

export PATH=$HOME/mc/bin:$PATH
source activate testenv

conda remove mcvine-core    # remove old installations
sleep 5

set -e
conda config --add channels mantid  # need mantid-framework
conda update mcvine-resources
# conda install mcvine-core
conda install -c mcvine/label/unstable mcvine
# conda install -c mcvine/label/unstable --force mcvine-core
conda list mcvine

export AWS_S3_PROFILE_NAME=ndav_mcvine

# checking installation
which py.test
python -c "import mcvine"
mcvine

py.test -s
# python SEQ/singlecrystal-SpinWave/test_singlecrystal_SpinWave.py
# python SEQ/powder-V/test_seq_powder_V.py
