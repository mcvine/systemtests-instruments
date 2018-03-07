#!/bin/bash

# check these parameters!!!
AWS_S3_ACCESS_ID=AKIAJ6RZWYBY6VPESDNQ
AWS_S3_ACCESS_SECRET=SECRET
AWS_S3_PROFILE_NAME=ndav_mcvine
CORES=8

set -e

wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh;
# install MC
chmod +x miniconda.sh
MC_PREFIX=$HOME/mc  # /home/jenkins/mc or /home/ec2-user/mc etc
rm -rf $MC_PREFIX
./miniconda.sh -b -p $MC_PREFIX
export PATH=$MC_PREFIX/bin:$PATH

conda config --set always_yes true
conda update conda
conda config --add channels conda-forge
conda config --add channels mcvine
conda create -n testenv python=2
source activate testenv
conda install -c conda-forge numpy
conda install -c mantid mantid-framework
conda install pytest
conda install awscli

python init_mantid_user_config.py
python setup-aws-testconfig.py
