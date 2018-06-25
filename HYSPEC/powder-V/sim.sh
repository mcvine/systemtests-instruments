#!/bin/bash

rm -rf mysim

# conda list mcvine

# create workflow
mcvine workflow powder --instrument=HYSPEC --sample=V --workdir=mysim
cd mysim
# setup beam
rm -rf beam
ln -s ~/beam/HYSPEC/20meV beam
# run simulation
if make NCOUNT=$NCOUNT NODES=$NODES BUFFER_SIZE=$BUFFER_SIZE QAXIS="$QAXIS" DETECTOR_VESSEL_ANGLE=$DETECTOR_VESSEL_ANGLE; then
    ls
else
    cat log.scatter log.create-nxs log.reduce
    exit 1
fi

set -e
# postprocess to get iqe.h5 and ie.h5
cd -
python post-process.py

# plot and save to S3
plothist iqe.h5 --min=0 --output=iqe.png
plothist ie.h5 --output=ie.png
S3_DEST=s3://ndav-mcvine/${JOB_NAME}/${BUILD_NUMBER}/HYSPEC/powder-V
S3_OPTS="--profile ${AWS_S3_PROFILE_NAME}"
aws s3 cp iqe.png ${S3_DEST}/iqe.png ${S3_OPTS}
aws s3 cp ie.png ${S3_DEST}/ie.png ${S3_OPTS}

# validate result
python validate.py
