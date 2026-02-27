#!/bin/bash

rm -rf ~/.config/nvim/*
rm -rf ~/.config/htop/
rm -rf ~/.config/nvim/
rm -rf ~/.config/pip/
rm -rf ~/.config/tmux/
rm -rf ~/.config/zsh/

cp ./.zshenv ~/.zshenv

cp -r ./.config/* ~/.config
cp -r ./.local/* ~/.local
