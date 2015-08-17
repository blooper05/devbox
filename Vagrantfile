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
        version: '2.3.6',
        checksum: 'cc89b2bd44c738d5041ce57db27a8106ba98065f72ce97598765108f8f5c614d'
      },
      postgresql: {
        enable_pgdg_yum: true,
        version: '9.3',
        password: { postgres: 'postgres' }
      }
    }
  end

  # Plugins
  config.omnibus.chef_version = :latest
  config.cache.scope          = :box if Vagrant.has_plugin?('vagrant-cachier')
end
