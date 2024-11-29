#!/bin/bash

# Get the URL as input
read -p "Plugin URL (username/repo): " plugin_url

# Use sed to insert the new plugin entry above the "end)" line
sed -i -e '/end)/ { 
            s/end)/\tuse "'$plugin_url'"\nend)/
        }'  ~/.config/nvim/lua/plugins.lua

# Inform the user
echo "Plugin $plugin_url added to your Neovim"

