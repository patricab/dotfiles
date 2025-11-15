#!/bin/bash

sudo rm /etc/*bashrc*
sudo rm /etc/*zshrc*
export NIX_BUILD_GROUP_ID=30000
sh <(curl -L https://nixos.org/nix/install)
