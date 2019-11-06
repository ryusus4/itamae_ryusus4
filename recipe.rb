execute 'apt-get update'

include_recipe "recipes/fish.rb"
include_recipe "recipes/rbenv.rb"
include_recipe "recipes/docker.rb"
