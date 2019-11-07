require './modules/file_line_addable.rb'

USER = node['user']
RUBY_VERSION = node['rbenv']['global']

package 'git'
package 'build-essential'
package 'libssl-dev'
package 'libreadline-dev'
package 'zlib1g-dev'
package 'libmysqlclient-dev'

git ".rbenv" do
  user USER
  repository 'https://github.com/sstephenson/rbenv.git'
end
git ".rbenv/plugins/ruby-build" do
  user USER
  repository 'https://github.com/sstephenson/ruby-build.git'
end

execute 'fish -c "set -U fish_user_paths ~/.rbenv/bin $fish_user_paths"' do
  user USER
  not_if 'fish -c "echo $PATH" | grep "~/.rbenv/bin"'
end

execute "fish -c 'rbenv install -s #{RUBY_VERSION}'" do
  user USER
end
execute "fish -c 'rbenv global #{RUBY_VERSION} && rbenv rehash'" do
  user USER
end

add_file_line(path: '.config/fish/config.fish', user: USER, line: 'status --is-interactive && source (rbenv init -|psub)')
