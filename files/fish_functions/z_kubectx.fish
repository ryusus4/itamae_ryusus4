function z_kubectx
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  kubectx|peco $peco_flags|read foo

  if [ $foo ]
    commandline "kubectx $foo"
  else
    commandline ''
  end
end
