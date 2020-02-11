#!/bin/bash
s1="On"
s2="On"
s3="On"
s4="On"
s5="On"
s6="On"
s7="On"
s8="On"
s9="On"
clear

FUNCTION=("APT" "PENTEST" "VIM" "HARDLINK" "GIT" "MAILSPRING" "NORDVPN" "DROPBOX" "UPGRADE")

if [ $1 == -d ] || [ $1 == --default ];
then
	FUNCTION=("APT" "PENTEST" "VIM" "HARDLINK" "GIT" "UPGRADE" "MAILSPRING" "NORDVPN" "DROPBOX")
	sudo apt-get -y update
	for i in "${!FUNCTION[@]}"; 
	do   
		${FUNCTION[$i]} 
	done
fi

function MAIN() {
clear
echo "patricab Automatic Config Script"
echo "======================"
echo "1) Apt-packages: $s1"
echo "2) Pentest packages: $s2"
echo "3) Vim plugins: $s3"
echo "4) Hardlink config files: $s4"
echo "5) Git setup: $s5"
echo "6) Upgrade system and reboot: $s6"
echo "=== Specific programs ==="
echo "7) Mailspring: $s7"
echo "8) Nordvpn: $s8"
echo "9) Dropbox: $s9"
echo "----------------------"
echo "i) Install "
echo "r) Reset"
echo "q) Quit"
echo "======================"
read -p "> " ans

case $ans in
1) s1="Off"; unset FUNCTION[0]; MAIN ;;
2) s2="Off"; unset FUNCTION[1]; MAIN ;;
3) s3="Off"; unset FUNCTION[2]; MAIN ;;
4) s4="Off"; unset FUNCTION[3]; MAIN ;;
5) s5="Off"; unset FUNCTION[4]; MAIN ;;
6) s6="Off"; unset FUNCTION[5]; MAIN ;;
7) s7="Off"; unset FUNCTION[6]; MAIN ;;
8) s8="Off"; unset FUNCTION[7]; MAIN ;;
9) s9="Off"; unset FUNCTION[8]; MAIN ;;

[iI])
	sudo apt-get -y update
	for i in "${!FUNCTION[@]}"; 
	do   
		${FUNCTION[$i]} 
	done
	;;
[rR])
	s1="On"
	s2="On"
	s3="On"
	s4="On"
	s5="On"
	s6="On"
	s7="On"
	s8="On"
	s9="On"
	FUNCTION=("APT" "PENTEST" "VIM" "HARDLINK" "GIT" "UPGRADE" "MAILSPRING" "NORDVPN" "DROPBOX")
    clear
    MAIN
    ;;
q) exit ;;
*) MAIN ;;
esac
}

function APT() {
sudo apt-get -y install gcc-avr 
sudo apt-get -y install avr-libc 
sudo apt-get -y install avrdude
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
sudo apt-get -y install exuberant-ctags
#sudo apt-get -y install nodejs
#sudo apt-get -y install sonic-pi
#sudo apt-get -y install deluge
#sudo apt-get -y install freecad
#sudo apt-get -y install thunderbird
#sudo apt-get -y install mupen64plus
}

function PENTEST() {
# Installing se-toolkit
sudo mkdir /pentest
cd /pentest
sudo git clone https://github.com/trustedsec/social-engineer-toolkit.git
cd social-engineer-toolkit/
sudo python setup.py install
}

function VIM() {
# Vim plugins
cd ~
mkdir -p .vim/bundle
cd .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall +qall # Install plugins
}

function HARDLINK() {
# Config files
cd ~
ln -f .conf .config/i3/config # Adds hardlink between custom i3 config and i3/config
}

function GIT() {
# Git setup
git config --global core.editor vim
git config --global user.name "patricab"
git config --global user.email pigface.survey@gmail.com
}

function MAILSPRING() {
# Mailspring - Email client
cd ~
sudo snap install mailspring 
}

function NORDVPN() {
# Nordvpn
cd ~
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo apt -y install nordvpn-release_1.0.0_all.deb
rm nordvpn-release_1.0.0_all.deb
}

function DROPBOX() {
# Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf
~/.dropbox-dist/dropboxd
}

function UPGRADE() {
# Upgrade system and reboot
sudo apt-get -y upgrade
sudo reboot
}

MAIN
