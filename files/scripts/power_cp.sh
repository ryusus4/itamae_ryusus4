#!/bin/bash

# 実行時に指定された引数の数、つまり変数 $# の値が 3 でなければエラー終了。
if [ $# -ne 2 ]; then
  echo "実行するには2個の引数が必要です。" 1>&2
  exit 1
fi

echo $1から$2まで
git log $1^..$2 --pretty=format:'%h %Cgreen%ad %Cblue%cn %Creset%s' --date=short

echo -n 'cherry-pickしますか? [y/n]'
read answer

case $answer in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) git cherry-pick $1^..$2;;
    * ) echo "中断";;
esac
