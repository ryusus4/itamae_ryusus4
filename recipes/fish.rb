USER = node['user']

execute 'apt-add-repository ppa:fish-shell/release-3 -y && apt-get update' do
  not_if "ls /etc/apt/sources.list.d | grep '^fish-shell-ubuntu-release-3-.*list'"
end
package 'fish'

execute "chsh #{USER} -s $(which fish)"

# FIXME: fishの中から返ってこれず二回実行する必要がある
execute 'curl -s -N -L https://get.oh-my.fish | fish' do
  user USER
  not_if 'fish -c "omf --version"'
end

execute 'fish -c "omf install agnoster"' do
  user USER
  not_if 'fish -c "omf theme | grep \'agnoster.*default\'"'
end
