devbox
====

Development Environment with Vagrant, Chef and Berkshelf.

## Description

This will provision a Vagrant Box with:

* [Git](http://git-scm.com/)
* [Graphviz](http://www.graphviz.org/)
* [Node.js](http://nodejs.org/)
* [PostgreSQL](http://www.postgresql.org/)
* [rbenv](https://github.com/sstephenson/rbenv)
* [ruby-build](https://github.com/sstephenson/ruby-build)
* [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs)
* [Ruby](https://www.ruby-lang.org/)

## Requirement
### Software
* [VMware Fusion](http://www.vmware.com/)
* [Vagrant](http://www.vagrantup.com/)
* [ChefDK](http://downloads.getchef.com/chef-dk/)

Install with Homebrew Cask:
 ```sh
brew cask install vmware-fusion vagrant chefdk
```

### Vagrant Plugins
* [vagrant-vmware-fusion](http://www.vagrantup.com/vmware)
* [vagrant-omnibus](https://github.com/opscode/vagrant-omnibus)
* [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier)

Install plugins and license:
 ```sh
vagrant plugin install vagrant-vmware-fusion vagrant-omnibus vagrant-cachier
vagrant plugin license vagrant-vmware-fusion /PATH/TO/license.lic
```

## Installation
1. Clone this repository:
 ```sh
git clone git@github.com:blooper05/devbox.git /PATH/TO/devbox
cd /PATH/TO/devbox
```

1. Install the cookbooks:
 ```sh
berks vendor cookbooks
```

1. Get Vagrant up and provision:
 ```sh
vagrant up
```

## Usage
1. SSH into a Vagrant machine:
 ```sh
vagrant ssh
```

1. Setting up Git:
 ```sh
git config --global user.name "NAME"
git config --global user.email "MAIL"
```

1. Clone project repository:
 ```sh
ssh-keygen
cat ~/.ssh/id_rsa.pub
git clone git@github.com:PROJECT/REPOSITORY.git /PATH/TO/REPOSITORY
cd /PATH/TO/REPOSITORY
```

1. Setting up project:
 ```sh
bundle config build.pg --with-pg-config=/usr/pgsql-9.3/bin/pg_config
bundle install --path vendor/bundle --binstubs .bundle/bin
```

1. Setting up Database:
 ```sh
rake db:create
rake db:migrate
```

## License
This software is released under the MIT License, see LICENSE.

## Author
[blooper05](https://github.com/blooper05)
