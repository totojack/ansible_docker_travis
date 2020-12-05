Vagrant.configure("2") do |config|
  ##### VM definition #####
  config.vm.box = "centos/8"
  config.vm.box_check_update = false  

  config.vm.define "centos01" do |centos01|
    centos01.vm.hostname = "centos01"
  end

  config.vm.define "centos02" do |centos02|
    centos02.vm.hostname = "centos02"
  end

  ##### VM provision #####
  config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = true
    ansible.limit = "all"
    ansible.inventory_path = 'hosts'
    ansible.playbook = "provision-vagrant.yml"
  end
end