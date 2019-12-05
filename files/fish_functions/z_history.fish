function z_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  builtin history --show-time='%Y/%m/%d %H:%M:%S   ' | peco $peco_flags |  awk '{ gsub(/^([0-9]|\/)* ([0-9]|\:)*   /, ""); print }' | read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
