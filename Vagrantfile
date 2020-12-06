ENV['VAGRANT_EXPERIMENTAL'] = 'disks'
Vagrant.configure("2") do |config|
  ##### VM definition #####
  config.vm.box = "centos/8"
  config.vm.box_check_update = false  
  config.vm.disk :disk, size: "40GB", primary: true

  # define sync folders
  config.vm.synced_folder "./", "/home/vagrant/provision", create: false, type: "rsync", rsync__auto: true, rsync__args: ["--verbose", "--archive", "-z", "--copy-links"]

  config.vm.define "centos01" do |centos01|
    centos01.vm.hostname = "centos01"
  end

  config.vm.define "centos02" do |centos02|
    centos02.vm.hostname = "centos02"
  end

  ##### VM provision #####
  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/home/vagrant/provision/"
    ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
    ansible.verbose = true
    
    #playbook settings
    ansible.inventory_path = 'hosts'
    ansible.playbook = "provision-vagrant.yml"
    ansible.limit = "all"
    ansible.galaxy_role_file = "requirements.yml"
  end
end