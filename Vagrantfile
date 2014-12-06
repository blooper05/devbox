# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box     = 'centos'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_centos-6.6_chef-provisionerless.box'

  config.omnibus.chef_version = :latest

  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(cookbooks site-cookbooks)
    chef.run_list = %w(
      git::source
      postgresql::server
      rbenv::default
      rbenv::ruby_build
      graphviz
      base
    )
    chef.json = {
      git: { version: '2.2.0' },
      postgresql: {
        enable_pgdg_yum: true,
        version: '9.3',
        password: { postgres: 'postgres' }
      }
    }
  end
end
