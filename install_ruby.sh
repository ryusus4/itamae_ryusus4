sudo apt-get update
sudo apt install git

sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> $HOME/.bashrc
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

rbenv install 2.6.5
rbenv global 2.6.5
