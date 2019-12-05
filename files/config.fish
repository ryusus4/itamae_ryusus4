set REPO_DIR ~
cd $REPO_DIR

set -x PATH $HOME/scripts $PATH
set -x PATH /usr/local/bin $PATH

alias g=git
alias gch=git checkout
alias gf=git fetch

alias dc=docker-compose
alias dcd=docker-compose down
alias dcb=docker-compose build
alias dcu=docker-compose up -d
alias dce=docker-compose exec

alias c=clear

function dckaolog --description "dckaolog container"
 docker-compose logs -f --tail 300 $argv[1] | grep "( ・∇・)"
end

function gs --description "git switch with reset"
  bash git_reset.sh && git checkout $argv[1]
end
