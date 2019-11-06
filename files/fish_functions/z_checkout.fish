function z_checkout
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  git branch|peco $peco_flags|string trim -l|read foo

  if [ $foo ]
    commandline "git checkout $foo"
  else
    commandline ''
  end
end
