#!/bin/bash
cd ~
clear

# Installing packages, updating system and creating directories
sudo apt-get -y update
sudo apt-get -y install cmake
sudo apt-get -y install snapd
sudo apt-get -y install wine
sudo apt-get -y install wireshark
sudo apt-get -y install slack-desktop
sudo apt-get -y install vim
sudo apt-get -y install python3
sudo apt-get -y install dos2unix
sudo apt-get -y install nmap
sudo apt-get -y install gqrx
sudo apt-get -y install tmux
sudo apt-get -y install netcat
sudo apt-get -y install pm-utils
sudo apt-get -y install tcpdump
sudo apt-get -y install hping3
sudo apt-get -y install ranger
sudo apt-get -y install zathura
sudo apt-get -y install feh
sudo apt-get -y install git
sudo apt-get -y install screenfetch
sudo apt-get -y install autojump
sudo apt-get -y install nodejs

# Vim plugins
cd ~
mkdir -p .vim/bundle
cd .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall +qall # Install plugins

# Git setup
# git config --global core.editor vim
git config --global core.editor "code --wait"
git config --global user.name "patricab"
git config --global user.email patric.berthelsen@gmail.com

# Upgrade system and reboot
sudo apt-get -y upgrade