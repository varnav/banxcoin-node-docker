#!/bin/bash

source setup.sh
echo "Running $0 in $PWD"
set -ev
su banxcoind -c "/usr/bin/banxcoind"
