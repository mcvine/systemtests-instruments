#!/bin/bash

set -e

export GIT_FULL_HASH=`git rev-parse HEAD`

if [ ${USE_CACHE} == "no" ] ; then
    # install dependencies
    echo ${TRAVIS_PYTHON_VERSION}
    conda config --set always_yes true
    conda update conda
    conda config --add channels conda-forge
    conda config --add channels mcvine
    conda create -n testenv python=$TRAVIS_PYTHON_VERSION
    source activate testenv
    conda install -c conda-forge numpy
    conda install -c mcvine/label/unstable mcvine mcvine.workflow mcvine.phonon
    conda install -c mantid mantid-framework
    conda install pytest
    conda install awscli
fi

python init_mantid_user_config.py
