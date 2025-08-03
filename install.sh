#!/bin/bash

cp ~/dotfiles/.zshenv ~/.zshenv

cp -r ~/dotfiles/.config/* ~/.config
cp -r ~/dotfiles/.local/* ~/.local

if [ ! -d ~/.virtualenvs ]; then
    echo "Create virtualenv for nvim"

    mkdir ~/.virtualenvs
    python3 -m venv ~/.virtualenvs/neovim
    source ~/.virtualenvs/neovim/bin/activate
    pip install jupytext pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip
    deactivate

    echo "Install libmagickwand-dev and quarto (https://github.com/quarto-dev/quarto-cli/releases/)"
fi

