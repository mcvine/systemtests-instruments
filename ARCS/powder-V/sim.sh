#!/bin/bash

mcvine workflow powder --instrument=ARCS --sample=V --workdir=mysim
cd mysim
rm -rf beam
ln -s ~/beam/ARCS/100meV beam
make NCOUNT=1e5 NODES=4
cat log.scatter
cat log.create-nxs
cat log.reduce
ls
aws s3 cp \
    *.nxs s3://ndav-mcvine/systemtests-instruments/${TRAVIS_JOB_NUMBER}/ARCS/powder-V/ \
    --profile ${AWS_S3_PROFILE_NAME} 
cd -
