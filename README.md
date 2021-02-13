<!--- [![Build Status](https://travis-ci.org/mcvine/systemtests-instruments.svg?branch=master)](https://travis-ci.org/mcvine/systemtests-instruments) --->

<!--- [![Build Status](http://35.168.96.122:8080/buildStatus/icon?job=systemtests-instruments)](http://35.168.96.122:8080/job/systemtests-instruments/) --->

[![Build Status](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiR3pIMHBZTk1HTjF2R3JRUUpxSzlqTFBQenJ5NEg3NElMRlVLdEIzUDZ4U1F5YjFQN3NSZGsrUjNmRXdjeW4vMjM3cHNPaTV6ZXhhRCtpOGVNQmF2QWxnPSIsIml2UGFyYW1ldGVyU3BlYyI6IlpvRVEwUE4ydytQZk94UksiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)](https://console.aws.amazon.com/codesuite/codebuild/668650830132/projects/mcvine-systemtests-instruments-py3/)

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
