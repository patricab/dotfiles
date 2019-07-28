#!/bin/bash
cd ~
clear

# Installing packages, updating system and creating directories
sudo apt-get -y update
sudo apt-get -y install vim
sudo apt-get -y install nmap
sudo apt-get -y install john
sudo apt-get -y install gqrx
sudo apt-get -y install tmux
sudo apt-get -y install netcat
sudo apt-get -y install httrack
sudo apt-get -y install pm-utils
sudo apt-get -y install macchanger
sudo apt-get -y install aircrack-ng
sudo apt-get -y install network-manager
sudo apt-get -y install proxychains
sudo apt-get -y install xbacklight
sudo apt-get -y install mupen64plus
sudo apt-get -y install tcpdump
sudo apt-get -y install hping3
sudo apt-get -y install ranger
sudo apt-get -y install zathura
sudo apt-get -y install irssi
sudo apt-get -y install htop
sudo apt-get -y install feh
sudo apt-get -y install git
sudo mkdir /pentest
cd /pentest

# Installing se-toolkit
sudo git clone https://github.com/trustedsec/social-engineer-toolkit.git
cd social-engineer-toolkit/
sudo python setup.py install

# Upgrade system and reboot
sudo apt-get -y upgrade
sudo reboot
