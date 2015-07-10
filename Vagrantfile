# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1404"

  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.customize ["modifyvm", :id, "--cpus", 1, "--memory", 256]
  end

  config.vm.provision :shell, :inline => <<-END
    sed -i -e 's/%sudo\tALL=NOPASSWD:ALL/%sudo\tALL=(ALL:ALL) ALL/' /etc/sudoers
  END

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "tests/playbook.yml"
    ansible.verbose = "vvvv"
  end

  config.vm.provision :shell, :inline => <<-END
    apt-get install -qq -y software-properties-common
    add-apt-repository ppa:duggan/bats --yes
    apt-get update -qq
    apt-get install -qq -y bats
    sudo su - app -c "bats /vagrant/tests/bats/"

  END
end

