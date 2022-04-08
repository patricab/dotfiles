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
sudo apt-get -y install zsh

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
git config credential.helper cache # Make sure I don't have to type in my password 100 times

# Github CLI (GH)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt -y update
sudo apt -y install gh
gh auth login
gh conig set editor "code --wait"

# Upgrade system and reboot
sudo apt-get -y upgrade
