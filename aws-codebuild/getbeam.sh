#!/bin/bash

set -e

echo "Get beam"

export PATH=$HOME/mc/bin:$PATH
source activate test

THIS_SCRIPT_DIR=`dirname $0`
python $THIS_SCRIPT_DIR/setup-aws-testconfig.py

# export AWS_S3_PROFILE_NAME=ndav_mcvine
aws s3 sync s3://ndav-mcvine/beam/ $HOME/beam/ --profile ${AWS_S3_PROFILE_NAME}
