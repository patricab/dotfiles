#!/bin/bash
clear

# TODO: bootstrap this script
#
# Installing packages, update system
source .install_nix.sh
source .install_pkg.sh

# Vim plugins
#nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Git setup
# git config --global core.editor vim
git config --global core.editor "nvim"
git config --global user.name "patricab"
git config --global user.email patric.berthelsen@gmail.com
git config credential.helper cache # Make sure I don't have to type in my password 100 times

# Oh my Zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Autojump
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Github
gh auth login
gh config set editor "nvim"

# Rust
rustup default stable
