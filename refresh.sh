#!/bin/sh
set -e
set -u
cd ../tioxnet
TAGS=$(git tag -l | xargs)
cd ../tioxnet-release
for TAG in $TAGS; do
  git submodule init 
done
