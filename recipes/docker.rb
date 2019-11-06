USER = node['user']

package 'apt-transport-https'
package 'ca-certificates'
package 'curl'
package 'software-properties-common'

execute 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
execute 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && apt-get install'
package 'docker-ce'

execute "gpasswd -a #{USER} docker"

execute 'curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
execute 'chmod +x /usr/local/bin/docker-compose'
