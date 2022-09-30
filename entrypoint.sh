#!/bin/bash

rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

ROVER_FOLDER="./rover"

unzip -o rover.zip -d $ROVER_FOLDER

#BRANCH="$4"
BRANCH="testing-upload"
#OIDC_TOKEN="$5"

git checkout --orphan $BRANCH
git reset --hard
git commit --no-verify --allow-empty -m Initial gh-pages commit
git add --all $ROVER_FOLDER
git push --force $BRANCH:$BRANCH