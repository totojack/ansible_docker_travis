# ansible_docker_travis

## Setup

- install Vagrant: https://www.vagrantup.com/docs/installation
- install serverspec plugin for Vagrant: vagrant plugin install vagrant-serverspec

If you want to generate a self signed CA + docker keys: https://milliams.com/posts/2020/ansible-certificate-authority/

## Playbook references

- ansible vagrant local provision: https://www.vagrantup.com/docs/provisioning/ansible_local
- setup docker role: https://github.com/geerlingguy/ansible-role-docker
It installs docker with a specific version.
- secure docker API role (Ubuntu): https://github.com/FlorianKempenich/ansible-role-setup-secure-remote-docker-daemon
The role tasks enable the tls configurations starting from already generated self-signed certificates.
- setup swarm role: https://github.com/atosatto/ansible-dockerswarm
It's a complete role which allows to install also docker and docker-compose cli. It has filters to allow only the setup of docker swarm.