# ansible_docker_travis

## Setup locale

- install Vagrant: https://www.vagrantup.com/docs/installation
- install serverspec plugin for Vagrant: vagrant plugin install vagrant-serverspec

If you want to generate a self signed CA + docker keys: https://milliams.com/posts/2020/ansible-certificate-authority/

## Playbook

- ansible vagrant provision: https://www.vagrantup.com/docs/provisioning/ansible_local
- setup docker: https://github.com/geerlingguy/ansible-role-docker
- secure docker API (Ubuntu): https://github.com/FlorianKempenich/ansible-role-setup-secure-remote-docker-daemon