# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
    config.vm.box = "stutz/devbox"
    config.vm.box_url = "https://atlas.hashicorp.com/stutz/boxes/devbox/versions/0.0.1/providers/virtualbox.box"


    config.vm.hostname = "vagrant-stutz-io"
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "private_network", ip: "192.168.10.10"


    # sharing folders, only enables nfs on *unix OS
    config.vm.synced_folder "./htdocs", "/var/www/", :create => true,
        # owner / group does not work with nfs (uncomment on windows!)
        # :mount_options => ["nfsvers=4", "dmode=777", "fmode=666"],
        # owner: "vagrant",
        # group: "www-data",
        :nfs => false # (RUBY_PLATFORM =~ /linux/ or RUBY_PLATFORM =~ /darwin/)


    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--name", "devbox"]
    end


    config.vm.provision "shell", inline: <<-SHELL
        if [[ -f /home/vagrant/postinstall.sh ]]; then
            bash /home/vagrant/postinstall.sh;
        fi
    SHELL



    config.vm.provision "shell", inline: <<-SHELL
        if [[ -f /home/vagrant/pre-provision.sh ]]; then
            bash /home/vagrant/pre-provision.sh;
        fi
    SHELL


    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "ansible/playbook.yml"
    end


    config.vm.provision "shell", inline: <<-SHELL
        if [[ ! -f /base-run ]]; then bash /vagrant/scripts/base.sh; fi
    SHELL
end
