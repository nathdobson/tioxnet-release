#!/bin/sh
set -e
set -u
cd ../tioxnet
BRANCHES=$(git branch --format='%(refname:short)')
BRANCHES="v1.3"
cd ../tioxnet-release

{
  for BRANCH in $BRANCHES; do
    echo "[submodule \"$BRANCH\"]"
    echo "  path = $BRANCH"
    echo "  url = https://github.com/nathdobson/tioxnet"
  done
} > .gitmodules
#for BRANCH in $BRANCHES; do
#  git rm "$BRANCH" || true
#done
#
#rm -rf ./.git/modules/*
#
#for BRANCH in $BRANCHES; do
#  git config --remove-section submodule.$BRANCH || true
#done
#
#for BRANCH in $BRANCHES; do
#  git submodule add -- https://github.com/nathdobson/tioxnet $BRANCH
#  cd $BRANCH
#  git checkout $BRANCH
#  cd ..
#done
