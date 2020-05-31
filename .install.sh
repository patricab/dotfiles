#!/bin/bash
cd ~
clear

# Installing packages, updating system and creating directories
sudo apt-get -y update
sudo apt-get -y install snapd
sudo apt-get -y install wine
sudo apt-get -y install texlive
sudo apt-get -y install calibre
sudo apt-get -y install arduino
sudo apt-get -y install newsbeuter
sudo apt-get -y install morse
sudo apt-get -y install wireshark
sudo apt-get -y install skypeforlinux
sudo apt-get -y install slack-desktop
sudo apt-get -y install libreoffice
sudo apt-get -y install vim
sudo apt-get -y install vim-gtk
sudo apt-get -y install vlc
sudo apt-get -y install python3
sudo apt-get -y install dos2unix
sudo apt-get -y install firefox
sudo apt-get -y install gimp
sudo apt-get -y install alsa
sudo apt-get -y install acpi
sudo apt-get -y install audacity
sudo apt-get -y install compton
sudo apt-get -y install nm-applet
sudo apt-get -y install volumeicon
sudo apt-get -y install xrandr
sudo apt-get -y install google-chrome
sudo apt-get -y install spotify
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
sudo apt-get -y install tcpdump
sudo apt-get -y install hping3
sudo apt-get -y install ranger
sudo apt-get -y install zathura
sudo apt-get -y install irssi
sudo apt-get -y install htop
sudo apt-get -y install feh
sudo apt-get -y install git
sudo apt-get -y install screenfetch
sudo apt-get -y install okular
#sudo apt-get -y install nodejs
#sudo apt-get -y install sonic-pi
#sudo apt-get -y install deluge
#sudo apt-get -y install freecad
#sudo apt-get -y install thunderbird
#sudo apt-get -y install mupen64plus

# Config files
ln -f .conf .config/i3/config # Adds hardlink between custom i3 config and i3/config

# Vim plugins
cd ~
mkdir -p .vim/bundle
cd .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall +qall # Install plugins


## Programs ##
cd ~
sudo snap install mailspring # Mailspring - Email client

# Nordvpn
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo apt -y install nordvpn-release_1.0.0_all.deb
rm nordvpn-release_1.0.0_all.deb

# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf
~/.dropbox-dist/dropboxd

# Git setup
git config --global core.editor vim
git config --global user.name "patricab"
git config --global user.email pigface.survey@gmail.com

# Installing se-toolkit
#sudo mkdir /pentest
#cd /pentest
#sudo git clone https://github.com/trustedsec/social-engineer-toolkit.git
#cd social-engineer-toolkit/
#sudo python setup.py install

# Upgrade system and reboot
sudo apt-get -y upgrade
sudo reboot

