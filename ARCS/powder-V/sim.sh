#!/bin/bash

mcvine workflow powder --instrument=ARCS --sample=V --workdir=mysim
cd mysim
rm -rf beam
ln -s ~/beam/ARCS/100meV beam
make NCOUNT=1e7 NODES=4
aws s3 cp --profile ${AWS_S3_PROFILE_NAME} *.nxs \
    s3://ndav-mcvine/systemtests-instruments/${TRAVIS_JOB_NUMBER}/ARCS/powder-V/
cd -
