<!--- [![Build Status](https://travis-ci.org/mcvine/systemtests-instruments.svg?branch=master)](https://travis-ci.org/mcvine/systemtests-instruments) --->

<!--- [![Build Status](http://35.168.96.122:8080/buildStatus/icon?job=systemtests-instruments)](http://35.168.96.122:8080/job/systemtests-instruments/) --->

[![Build Status](https://codebuild.us-east-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoieVJqNXhNT2Q5aW1OWmVFS2pJZWtKM2tMN3NiZmJ4bk0zR21UY2pYVTNWNXNKMDdwRXo4YUhqakNwL1Q1NTNXMDZvNXR6TFlKdUd0Z3IxSjFXYTdpcU9RPSIsIml2UGFyYW1ldGVyU3BlYyI6IkZqOFNzeS9zKzVIcXJwQ28iLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

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
