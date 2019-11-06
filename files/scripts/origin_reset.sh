#!/bin/bash

if [ $# -ne 0 ]; then
  current=$1
else
  current=`git rev-parse --abbrev-ref HEAD | awk '{ gsub(/_mirror/, ""); print }'`
fi

git reset --hard origin/$current
git log -p -1
echo $current
