#!/bin/bash

set -e
mcvine instruments seq beam -E=100 -ncount=1e9 -nodes=20
rm -rf _m2sout
