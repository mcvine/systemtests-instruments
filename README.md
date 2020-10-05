<!--- [![Build Status](https://travis-ci.org/mcvine/systemtests-instruments.svg?branch=master)](https://travis-ci.org/mcvine/systemtests-instruments) --->

[![Build Status](http://35.168.96.122:8080/buildStatus/icon?job=systemtests-instruments)](http://35.168.96.122:8080/job/systemtests-instruments/)

# System tests for instrument simulations

To run tests manually

* Install mcvine in a conda environment
* run getbeam.sh to download beam data
* Run
```
export AWS_S3_PROFILE_NAME=...
export JOB_NAME=systemtests-instruments
export BUILD_NUMBER=manual
PYTHONPATH=$PWD py.test -s
```
