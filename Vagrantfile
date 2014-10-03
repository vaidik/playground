# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Copy local public key for keyless ssh
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/authorized_keys"

    # Provision using shell
    config.vm.provision "shell", path: "vagrant-setup.sh"

    config.vm.define "lab", primary: true do |lab|
        # Box configuration
        lab.vm.box = "vaidikslab-vagrant"
        lab.vm.box_url = "https://www.dropbox.com/s/gr1emg8ytrtm916/vaidikslab-vagrant.box?dl=1"

        # Host name
        lab.vm.host_name = ENV["hostname"] || "lab"
    end

    config.vm.define "basebox", primary: false do |basebox|
        # Box configuration
        basebox.vm.box = "debian-7.3.0"
        basebox.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-nocm.box"

        # Host name
        basebox.vm.host_name = "basebox"
    end
end
