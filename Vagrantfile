ENV['VAGRANT_EXPERIMENTAL'] = 'disks'

nodes = [
  { :hostname => 'centos01', :ip => '192.168.10.10', :docker_nat_port => '12376' },
  { :hostname => 'centos02', :ip => '192.168.10.11', :docker_nat_port => '22376' }
]

Vagrant.configure("2") do |config|
  ##### VM definition #####
  config.vm.box = "centos/8"
  config.vm.box_check_update = false  
  config.vm.disk :disk, size: "40GB", primary: true

  # define sync folders
  config.vm.synced_folder "./", "/home/vagrant/provision", create: false, type: "rsync", rsync__auto: true, rsync__args: ["--verbose", "--archive", "-z", "--copy-links"]

  # config.vm.define "centos01" do |centos01|
  #   centos01.vm.hostname = "centos01"
  #   centos01.vm.network :private_network, ip: '192.168.10.10'
  #   centos01.vm.network "forwarded_port", guest: 2376, host: 12376, protocol: "tcp"
  # end

  # config.vm.define "centos02" do |centos02|
  #   centos02.vm.hostname = "centos02"
  #   centos02.vm.network :private_network, ip: '192.168.10.11'
  #   centos02.vm.network "forwarded_port", guest: 2376, host: 22376, protocol: "tcp"
  # end

  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :private_network, ip: node[:ip]      
      nodeconfig.vm.network "forwarded_port", guest: 2376, host: node[:docker_nat_port], protocol: "tcp"
    end
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

  #### VM test ####
  config.vm.provision :serverspec do |spec|
    spec.pattern = 'test/*_spec.rb' # pattern for test files
  end

  # config.vm.define 'centos01' do |nodeconfig|
  #   ##### SWARM provision #####
  #   nodeconfig.vm.provision "ansible_local" do |ansible|
  #     ansible.provisioning_path = "/home/vagrant/provision/"
  #     ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  #     ansible.verbose = true
      
  #     #playbook settings
  #     ansible.inventory_path = 'hosts'
  #     ansible.playbook = "provision-swarm.yml"
  #     ansible.limit = "all"
  #     ansible.galaxy_role_file = "requirements.yml"
  #   end
  # end


end