#!/bin/bash

cd ~/dotfiles

mkdir -p ~/dotfiles/.config

cp ~/.zshenv ~/dotfiles
cp ~/.tmux.conf ~/dotfiles

cp -r ~/.config/nvim ~/dotfiles/.config
cp -r ~/.config/htop ~/dotfiles/.config
cp -r ~/.config/zsh ~/dotfiles/.config

git add --all
git commit -m "$(date -uIseconds)"
git push

