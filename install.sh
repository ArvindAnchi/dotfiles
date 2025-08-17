#!/bin/bash

rm -rf ~/.config/nvim/*
rm -rf ~/.config/htop/
rm -rf ~/.config/nvim/
rm -rf ~/.config/pip/
rm -rf ~/.config/tmux/
rm -rf ~/.config/zsh/

cp ~/dotfiles/.zshenv ~/.zshenv

cp -r ~/dotfiles/.config/* ~/.config
cp -r ~/dotfiles/.local/* ~/.local
