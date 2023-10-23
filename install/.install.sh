#!/bin/bash
clear

# TODO: bootstrap this script
#
# Installing packages, update system
sudo pacman -Syu
# sudo pacman -S --needed --noconfirm cmake wine wireshark vim python3 dos2unix nmap tmux netcat tcpdump hping3 ranger zathura \
# feh git screenfetch nodejs zsh github-cli vlc base-devel obsidian make patch autojump htop docker docker-compose neovim vlc mesa \
# ripgrep fzf
sudo pacman -S nix
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

while IFS= read -r line; do
    # Run the specified command with the current line as an argument
    sudo nix-env -iA "$line"
done < ".packages"

# Vim plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Git setup
# git config --global core.editor vim
git config --global core.editor "nvim"
git config --global user.name "patricab"
git config --global user.email patric.berthelsen@gmail.com
git config credential.helper cache # Make sure I don't have to type in my password 100 times

# Yay
# cd /tmp && git clone https://aur.archlinux.org/yay.git
# cd yay && makepkg -si --noconfirm && cd ~

# Nvidia driver
# sudo mhwd -a pci nonfree 0300
# sudo reboot

## AUR packages
# yay -S dropbox visual-studio-code-bin slack-desktop
# yay -S dropbox slack-desktop

# Oh my Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Github
gh auth login
gh config set editor "nvim"
