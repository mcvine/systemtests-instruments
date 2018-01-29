#!/bin/bash

set -e

# check
df -h
free

if [ ${USE_CACHE} == "no" ] ; then
    # get MC
    if [ ${TRAVIS_PYTHON_VERSION:0:1} == "2" ]; then
	wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh;
    else
	wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
    fi

    # install MC
    chmod +x miniconda.sh
    ./miniconda.sh -b -p /home/travis/mc
fi
