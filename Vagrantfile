# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Set vagrant box.
  config.vm.box = "puppetlabs/centos-6.6-64-nocm"

  #=============================================================================
  # Provisioning.
  #=============================================================================

  # Yum packages.
  config.vm.provision "shell", 
    path: "script/yum.sh",
    privileged: true

  # Configuration files.
  config.vm.provision "shell",
    path: "script/rc.sh",
    privileged: false

  # Miniconda.
  config.vm.provision "shell",
    path: "script/miniconda_install.sh",
    privileged: false

  # Miniconda packages.
  config.vm.provision "shell",
    path: "script/miniconda_packages.sh",
    privileged: false

  # Git
  config.vm.provision "shell",
    path: "script/git.sh",
    privileged: true

  # ccache
  config.vm.provision "shell",
    path: "script/ccache.sh",
    privileged: true

  # Memory and CPU.
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 8
  end

end
