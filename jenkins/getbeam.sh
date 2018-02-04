#!/bin/bash

set -e

echo "Get beam"

export PATH=$HOME/mc/bin:$PATH
source activate testenv

aws s3 sync s3://ndav-mcvine/beam/ $HOME/beam/ --profile ${AWS_S3_PROFILE_NAME}
