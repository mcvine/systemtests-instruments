#!/bin/bash

set -e

echo "Get beam"

source activate testenv
python travis/setup-aws-testconfig.py

if [ ${USE_CACHE} == "no" ] ; then
    aws s3 sync s3://ndav-mcvine/beam/ $HOME/beam/ --profile ${AWS_S3_PROFILE_NAME}
fi
