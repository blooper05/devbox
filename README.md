devbox
====

Development Environment with Vagrant, Chef and Berkshelf.

## Description

This will provision a Vagrant Box with:

* [Git](http://git-scm.com/)
* [PostgreSQL](http://www.postgresql.org/)
* [rbenv](https://github.com/sstephenson/rbenv)
* [ruby-build](https://github.com/sstephenson/ruby-build)

## Requirement
### Software
* [VMware Fusion](http://www.vmware.com/)
* [Vagrant](http://www.vagrantup.com/)
* [ChefDK](http://downloads.getchef.com/chef-dk/)

```sh
brew cask install vmware-fusion
brew cask install vagrant
brew cask install chefdk
```

### Vagrant Plugins
* [vagrant-vmware-fusion](http://www.vagrantup.com/vmware)
* [vagrant-omnibus](https://github.com/opscode/vagrant-omnibus)
* [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)

```sh
vagrant plugin install vagrant-vmware-fusion
vagrant plugin license vagrant-vmware-fusion /PATH/TO/license.lic
vagrant plugin install vagrant-omnibux
vagrant plugin install vagrant-cachier
```

## Installation
```sh
git clone git@github.com:blooper05/devbox.git /PATH/TO/devbox
cd /PATH/TO/devbox
berks vendor vendor/cookbooks
vagrant up
```

## Usage
1. SSH into a Vagrant machine
```sh
vagrant ssh
```

1. Add vagrant user to rbenv group
```sh
sudo gpasswd -a vagrant rbenv
```

1. Login again to reflect group changes
```sh
exit
vagrant ssh
```

1. Install Ruby
```sh
rbenv install 2.1.3
rbenv global 2.1.3
rbenv versions
```

1. Install Bundler
```sh
gem update --system
gem -v
gem install bundler --no-document
rbenv rehash
bundle -v
```

1. Setting up Git
```sh
git config --global user.name "NAME"
git config --global user.email "MAIL"
```

1. Clone project repository
```sh
ssh-keygen
cat ~/.ssh/id_rsa.pub
git clone git@github.com:PROJECT/REPOSITORY.git /PATH/TO/REPOSITORY
```

1. Setting up project
```sh
cd /PATH/TO/REPOSITORY
bundle config build.pg --with-pg-config=/usr/pgsql-9.3/bin/pg_config
bundle install --path vendor/bundle
```

1. Install rbenv-binstubs
```sh
git clone git@github.com:ianheggie/rbenv-binstubs.git /opt/rbenv/plugins/rbenv-binstubs
bundle install --binstubs .bundle/bin
rbenv rehash
```

1. Setting up PostgreSQL
```sh
sudo -u postgres createuser -U postgres vagrant -s
rake RAILS_ENV=development db:create
rake RAILS_ENV=test db:create
rake db:migrate
```

## Licence
This software is released under the MIT License, see LICENSE.

## Author
[blooper05](https://github.com/blooper05)