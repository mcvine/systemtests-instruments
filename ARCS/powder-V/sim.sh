#!/bin/bash

conda list mcvine

mcvine workflow powder --instrument=ARCS --sample=V --workdir=mysim
cd mysim
rm -rf beam
ln -s ~/beam/ARCS/100meV beam
make NCOUNT=$NCOUNT NODES=$NODES BUFFER_SIZE=$BUFFER_SIZE
cat log.scatter
cat log.create-nxs
cat log.reduce
ls

cd -
python post-process.py

# plot and save to S3
plothist iqe.h5 --min=0 --output=iqe.png
plothist ie.h5 --output=ie.png
S3_DEST=s3://ndav-mcvine/systemtests-instruments/${TRAVIS_JOB_NUMBER}/ARCS/powder-V
S3_OPTS="--profile ${AWS_S3_PROFILE_NAME}"
# aws s3 cp iqe.png ${S3_DEST}/iqe.png ${S3_OPTS}
# aws s3 cp ie.png ${S3_DEST}/ie.png ${S3_OPTS}

# validate result
python validate.py
