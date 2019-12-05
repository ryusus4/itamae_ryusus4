function z_rebase
  git log --oneline --decorate -n 20|peco|cut -d" " -f1|read foo

  if [ $foo ]
    commandline "git rebase -i $foo^"
  else
    commandline ''
  end
end
