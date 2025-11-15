#!/bin/bash

nix-channel --update
while IFS= read -r line; do
   # Run the specified command with the current line as an argument
   sudo nix-env -iA "$line"
done < ".packages"
