#!/bin/bash

cd ~/five/server
NOWCOMMIT=`git rev-parse HEAD`
git reset --hard HEAD
git add -A --all
git commit -m "trash"
git reset --hard $NOWCOMMIT
git status
