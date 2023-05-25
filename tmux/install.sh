#!/usr/bin/env bash

read -p "Enter package to install: " package

# tmux neww zsh -c "sudo pacman -S $package & while [ : ]; do sleep 1; done"
tmux neww zsh -c "sudo pacman -S $package"
echo $package >> ~/.dotfiles/packages
