#!bin/bash

git branch --merged | grep -v -e '^development$' -v -e '*' -v -e '^master$' -v -e '^release$' -v -e '^production$'  | xargs -I % git branch -D %
git branch | grep '_tmp$' | xargs -I % git branch -D %
