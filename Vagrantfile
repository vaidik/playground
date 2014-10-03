# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Copy local public key for keyless ssh
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/authorized_keys"

    # Provision using shell
    config.vm.provision "shell", path: "vagrant-setup.sh"

    config.vm.define "playground", primary: true do |playground|
        # Box configuration
        playground.vm.box = "vagrant-playground"
        playground.vm.box_url = "https://www.dropbox.com/s/nd9nk6v9pxnlibv/vagrant-playground.box?dl=1"

        # Host name
        playground.vm.host_name = ENV["hostname"] || "playground"
    end

    config.vm.define "basebox", primary: false, autostart: false do |basebox|
        # Box configuration
        basebox.vm.box = "debian-7.3.0"
        basebox.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-nocm.box"

        # Host name
        basebox.vm.host_name = "basebox"
    end
end
