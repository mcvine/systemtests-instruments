#!/usr/bin/env bash

set -e

echo "System testing of sample assemblies"

source activate testenv

py.test -s
