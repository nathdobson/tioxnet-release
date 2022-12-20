#!/bin/sh
set -e
set -u
cd ../tioxnet
BRANCHES=$(git branch --format='%(refname:short)')
cd ../tioxnet-release

#for BRANCH in $BRANCHES; do
#  git rm --cached "$BRANCH" || true
#  rm -rf ./v*/
#  rm -rf ./main/
#done
#rm -rf ./.git/modules/*
#for BRANCH in $BRANCHES; do
#  git config --remove-section submodule.$BRANCH || true
#done

for BRANCH in $BRANCHES; do
  if [[ ! -d $BRANCH ]]; then
    git submodule add -b $BRANCH -- https://github.com/nathdobson/tioxnet $BRANCH
  fi
done

git add .
git commit -m "Updated releases"
