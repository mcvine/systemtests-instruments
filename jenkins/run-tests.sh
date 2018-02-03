#!/usr/bin/env bash

set -e

echo "System testing of instruments"

export PATH=$HOME/mc/bin:$PATH
source activate testenv

conda install -c mcvine/label/unstable mcvine mcvine.workflow mcvine.phonon

AWS_S3_PROFILE_NAME=ndav_mcvine
py.test -s
