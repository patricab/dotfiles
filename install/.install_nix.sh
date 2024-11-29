#!/bin/bash

sudo rm /etc/*bashrc*
sh <(curl -L https://nixos.org/nix/install)
