#!/bin/bash

# Install base apt packages
sudo apt-get update
sudo apt-get install -y build-essential git-core vim tmus zsh python-pip python-dev

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.zshrc
/bin/zsh
rbenv install 1.9.3-p392

# Install NodeJS 0.10.x from Source
wget http://nodejs.org/dist/v0.10.20/node-v0.10.20.tar.gz
tar -zxvf node-v0.10.20.tar.gz
cd node-v0.10.20
./configure
make
sudo make install
cd ..

# Install some global python stuff
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install grip

# Install some global node stuff
sudo npm install -g grunt-cli

