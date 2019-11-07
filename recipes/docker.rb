USER = node['user']
DOCKER_COMPOSE_VERSION = node['docker']['docker-compose']['version']

package 'apt-transport-https'
package 'ca-certificates'
package 'curl'
package 'software-properties-common'

execute 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
execute 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && apt-get install'
package 'docker-ce'

execute "gpasswd -a #{USER} docker"

execute "curl -L \"https://github.com/docker/compose/releases/download/#{DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose" do
  not_if "find /usr/local/bin/docker-compose"
end
execute 'chmod +x /usr/local/bin/docker-compose'
