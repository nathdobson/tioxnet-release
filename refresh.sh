#!/bin/sh
set -e
set -u
cd ../tioxnet
BRANCHES=$(git branch --format='%(refname:short)')
#BRANCHES="v1.3"
cd ../tioxnet-release

for BRANCH in $BRANCHES; do
  git rm --cached "$BRANCH" || true
  rm -rf ./v*/
done
rm -rf ./.git/modules/*
for BRANCH in $BRANCHES; do
  git config --remove-section submodule.$BRANCH || true
done

for BRANCH in $BRANCHES; do
  git submodule add -b $BRANCH -- https://github.com/nathdobson/tioxnet $BRANCH
done
