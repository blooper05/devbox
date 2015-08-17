#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

version = node[:base][:ruby_version]

rbenv_ruby version do
  global true
end

rbenv_gem 'bundler' do
  ruby_version version
end

node.set[:rbenv_binstubs][:prefix] = "#{node[:rbenv][:root]}/plugins/rbenv-binstubs"

with_home_for_user node[:rbenv][:user] do
  git node[:rbenv_binstubs][:prefix] do
    repository node[:rbenv_binstubs][:git_repository]
    reference  node[:rbenv_binstubs][:git_revision]
    action     :sync
    user       node[:rbenv][:user]
    group      node[:rbenv][:group]
  end
end

group :rbenv do
  action  :modify
  append  true
  members 'vagrant'
end

execute :createuser do
  command 'createuser -s vagrant'
  user    'postgres'
  not_if  'psql -c "\du" | grep -q vagrant', user: 'postgres'
end
