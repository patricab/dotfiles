#!/bin/bash
clear

# Installing packages, update system
sudo pacman -Syu
sudo pacman -S --needed --noconfirm cmake wine wireshark vim python3 dos2unix nmap tmux netcat tcpdump hping3 ranger zathura \
feh git screenfetch nodejs zsh github-cli vlc base-devel obsidian make patch autojump htop docker docker-compose neovim vlc 
# sudo pacman -S --needed  slack-desktop
# sudo pacman -S --needed pm-utils
# sudo pacman -S --needed autojump

# Vim plugins
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim
vim +PluginInstall +qall # Install plugins

# Git setup
# git config --global core.editor vim
git config --global core.editor "code --wait"
git config --global user.name "patricab"
git config --global user.email patric.berthelsen@gmail.com
git config credential.helper cache # Make sure I don't have to type in my password 100 times

# Yay
cd /tmp && git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm && cd ~

# Nvidia driver
# sudo mhwd -a pci nonfree 0300
# sudo reboot

## AUR packages
yay -S dropbox visual-studio-code-bin slack-desktop

# Oh my Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Spacevim
curl -sLf https://spacevim.org/install.sh | bash
# Github CLI (GH)
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# sudo apt -y install gh
# gh auth login
# gh conig set editor "code --wait"
