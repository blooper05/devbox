# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = 'centos'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-6.6_chef-provisionerless.box'

  # Forwarded Ports
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Agent forwarding over SSH connections
  config.ssh.forward_agent = true

  # Provisioning
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks site-cookbooks)
    chef.run_list = %w(
      git::source
      graphviz
      nodejs
      postgresql::server
      rbenv::default
      rbenv::ruby_build
      base
    )
    chef.json = {
      git: {
        version:  '2.5.0',
        checksum: '31ebd4f35b5b941a5ac51c01ecb211911650b834a4085878e854cce59a470424',
      },
      postgresql: {
        enable_pgdg_yum: true,
        version:         '9.3',
        password:        { postgres: 'postgres' },
      },
      base: {
        ruby_version: '2.2.2',
      }
    }
  end

  # Plugins
  config.omnibus.chef_version = :latest
  config.cache.scope          = :box if Vagrant.has_plugin?('vagrant-cachier')
end
