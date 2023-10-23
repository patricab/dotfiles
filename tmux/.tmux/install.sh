#!/usr/bin/env bash

read -p "Enter package to install: " package

tmux neww zsh -c "sudo nix-env -iA nixpkgs.$package"
echo "nixpkgs.$package" >> ~/.dotfiles/rc/.packages
