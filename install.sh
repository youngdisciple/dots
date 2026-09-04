#!/bin/bash

# Install packages
sudo pacman -Syu \
neovim \
tmux \
fzf \
base-devel                    

# move to /$HOME/.config
mv .config /$HOME/.config
