#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

versions = %w(2.1.3)

versions.each do |version|
  rbenv_ruby version do
    global true
  end

  rbenv_gem 'bundler' do
    ruby_version version
  end
end
