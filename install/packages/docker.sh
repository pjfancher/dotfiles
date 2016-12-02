#!/bin/bash
#################################
#      Install Docker           #
#################################

ask_for_sudo
print_in_purple "\n   Docker\n   ------------------------------\n"

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
&& sudo bash -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' > /etc/apt/sources.list.d/docker.list" \
&& sudo apt-get update && sudo apt-get purge lxc-docker && apt-cache policy docker-engine \
&& sudo apt-get update && sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual \
&& sudo apt-get update && sudo apt-get install docker-engine && sudo service docker start \
&& sudo bash -c "curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose" \
&& sudo chmod +x /usr/local/bin/docker-compose \
&& sudo adduser pj docker

print_success "Docker Installed"
