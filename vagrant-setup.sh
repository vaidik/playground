#!/bin/bash

apt-get install -y vim zsh

pushd /home/vagrant
git clone https://github.com/vaidik/dotfiles.git
chown -R vagrant:vagrant /home/vagrant

pushd dotfiles
su -c "pushd /home/vagrant/dotfiles && bash install.sh && popd" vagrant
popd

popd

chsh -s /bin/zsh vagrant
apt-get install -y python-pip
pip install ipython ipdb virtualenv virtualenvwrapper
