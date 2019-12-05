#!bin/bash

git branch --merged | grep -ve '^\s*\(development\|master\|production\)\(_mirror\)\?' -ve '^*'  | xargs -I % git branch -D %
git branch | grep '_tmp$' | xargs -I % git branch -D %
