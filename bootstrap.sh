#!/bin/bash

# Install base apt packages
cd ~
sudo apt-get update
sudo apt-get install -y --ignore-missing build-essential git-core vim tmux zsh python-pip python-dev curl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev wget getopt

if [ ! -d ~/.oh-my-zsh ]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# rbenv
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    eval "$(rbenv init -)"
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

rbenv install 1.9.3-p392
rbenv global 1.9.3-p392

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

# Install Horse.vim
wget -qO- https://github.com/BNOTIONS/horse.vim/raw/master/install.sh | sudo bash

# Link tmux.conf
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# scm breeze
if [ ! -d ~/.scm_breeze ]; then
    git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
    ~/.scm_breeze/install.sh
fi

# git flow
if [ ! -d ~/.gitflow ]; then
    git clone https://github.com/nvie/gitflow.git ~/.gitflow
    cd ~/.gitflow
    make install
    export PATH="$HOME/.gitflow:$PATH"
fi

# Make zsh default shell
chsh -s /bin/zsh

# All done. Switch to ZSH
/bin/zsh
