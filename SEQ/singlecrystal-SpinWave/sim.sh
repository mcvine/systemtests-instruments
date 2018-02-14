#!/bin/bash

rm -rf mysim
set -e

# conda list mcvine

# create workflow
STAGING_DIR=$PWD
WORKDIR=$PWD/mysim
mcvine workflow singlecrystal --outdir=${WORKDIR} --type=DGS \
       --instrument=SEQUOIA --sample=sample.yml
cd ${WORKDIR}
# setup beam
rm -rf beam
ln -s ~/beam/SEQ/100meV beam

# update sample
cp ${STAGING_DIR}/swdemo-scatterer.xml sampleassembly/

# sim config
cp ${STAGING_DIR}/sim.yml scattering

# scattering sim
cd scattering

# run one angle
# ./scripts/sim.py --angle=31.0

# run all angles
python $STAGING_DIR/create-run_scatter_angles_sh.py
chmod +x run_scatter_angles.sh
time ./run_scatter_angles.sh

# reduce
time mcvine workflow sx reduce tof2e --type batch \
     --eaxis -20 90 0.5 --psi-axis -90 90.1 15. \
     --eventnxs work_%s/sim_%s.nxs --out reduced_%s.nxs\
     > log.reduce

# get slice
time mcvine workflow sx reduce slice \
     --sample ${STAGING_DIR}/sample.yml \
     --psi-axis -90 90.1 15. \
     --nxs reduced_%s.nxs \
     --slice ${STAGING_DIR}/slice_H00.yml \
     --out slice_H00.nxs \
     > log.slice_H00
mcvine workflow sx reduce slice2hist slice_H00.nxs slice_H00.h5

# plot and save to S3
plothist slice_H00.h5 --min=0 --output=slice_H00.png
S3_DEST=s3://ndav-mcvine/${JOB_NAME}/${BUILD_NUMBER}/SEQ/singlecrystal-SpinWave
S3_OPTS="--profile ${AWS_S3_PROFILE_NAME}"
aws s3 cp slice_H00.png ${S3_DEST}/slice_H00.png ${S3_OPTS}

# validate result
python ${STAGING_DIR}/validate.py
