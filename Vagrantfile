# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = 'bento/ubuntu-16.04'
    config.vm.box_check_update = false

    # Don't use NFS at all
    config.nfs.functional = false
    config.nfs.verify_installed = false
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :libvirt do |libvirt|
        libvirt.default_prefix = 'SysCon'
        libvirt.storage_pool_name = 'user-vms'

        libvirt.cpus = 4
        libvirt.memory = 4096
        libvirt.cpu_mode = 'host-passthrough'

        libvirt.graphics_type = 'spice'
        libvirt.video_type = 'qxl'

        libvirt.keymap = 'de'

        libvirt.disk_bus = 'virtio'

        libvirt.redirdev :type => 'spicevmc'
    end

    config.vm.define :Xilinx do |syscon|
        syscon.vm.hostname = 'Xilinx'
        syscon.vm.network :private_network,
            :ip => '192.168.122.250'
    end

    config.vm.provision 'ansible' do |ansible|
        ansible.playbook = 'ansible/provision-vm.yml'
        ansible.groups = {
            "vm" => "Xilinx"
        }

    end

end
