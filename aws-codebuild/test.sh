#!/bin/bash

set -x
set -e
export PATH=$HOME/mc/bin:$PATH
source activate test

# export AWS_S3_PROFILE_NAME=ndav_mcvine
THIS_SCRIPT_DIR=`dirname $0`
$THIS_SCRIPT_DIR/getbeam.sh

# checking installation
which py.test
python -c "import mcvine"
mcvine

# py.test -s
