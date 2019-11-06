set REPO_DIR ~
cd $REPO_DIR

set -x PATH $HOME/scripts $PATH
set -x PATH /usr/local/bin $PATH

alias gch=git checkout
alias gf=git fetch
alias history_peco="builtin history --show-time='%Y/%m/%d %H:%M:%S ' | peco"
alias c=clear

function dckaolog --description "dckaolog container"
 docker-compose logs -f --tail 300 $argv[1] | grep "( ・∇・)"
end

function gs --description "git switch"
  bash git_reset.sh && git checkout $argv[1]
end
