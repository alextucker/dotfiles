#!/bin/bash

# Install base apt packages
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install git-core
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install zsh

# Install Ruby 1.9.3 from Source
wget http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz
tar -zxvf ruby-1.9.3-p448.tar.gz
cd ruby-1.9.3-p448.tar.gz
./configure
make
sudo make install
cd ..

# Install NodeJS 0.10.x from Source
wget http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz
tar -zxvf node-v0.10.20.tar.gz
cd node-v0.10.20.tar.gz
./configure
make
sudo make install
cd ..

# Install some global python stuff
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install grip

# Install some global node stuff
sudo npm install -g grunt-cli

