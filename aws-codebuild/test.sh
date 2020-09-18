#!/bin/bash

set -x
export PATH=$HOME/mc/bin:$PATH
source activate test

export AWS_S3_PROFILE_NAME=ndav_mcvine

# checking installation
which py.test
python -c "import mcvine"
mcvine

# py.test -s
