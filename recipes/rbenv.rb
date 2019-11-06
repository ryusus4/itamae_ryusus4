require './modules/file_line_addable.rb'

USER = node['user']
RUBY_VERSION = node['rbenv']['global']

package 'git'
package 'build-essential'
package 'libssl-dev'
package 'libreadline-dev'
package 'zlib1g-dev'

execute 'git clone https://github.com/sstephenson/rbenv.git /usr/local/.rbenv' do
  not_if "find /usr/local/.rbenv"
end
execute 'git clone https://github.com/sstephenson/ruby-build.git /usr/local/.rbenv/plugins/ruby-build && bash /usr/local/.rbenv/plugins/ruby-build/install.sh' do
  not_if "find /usr/local/.rbenv/plugins/ruby-build"
end

execute "fish -c 'set -x RBENV_ROOT /usr/local/.rbenv\nexport'"
execute 'fish -c "set -U fish_user_paths /usr/local/.rbenv/bin $fish_user_paths"' do
  not_if 'fish -c "echo $PATH" | grep "/usr/local/.rbenv/bin"'
end

execute "fish -c 'rbenv install -s #{RUBY_VERSION}'" do
  user USER
end
execute "fish -c 'rbenv global #{RUBY_VERSION} && rbenv rehash' && eval \"$(rbenv init -)\"" do
  user USER
end

add_file_line(path: '.config/fish/config.fish', user: USER, line: 'status --is-interactive; and source (rbenv init -|psub)')
