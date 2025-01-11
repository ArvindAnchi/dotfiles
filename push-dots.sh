#!/bin/bash

cd ~/dotfiles

mkdir -p ~/dotfiles/.config

cp ~/.zshenv ~/dotfiles

cp -r ~/.config/nvim ~/dotfiles/.config
cp -r ~/.config/htop ~/dotfiles/.config
cp -r ~/.config/zsh ~/dotfiles/.config
cp -r ~/.config/tmux ~/dotfiles/.config

git add --all
git commit -m "$(date -uIseconds)"
git push

