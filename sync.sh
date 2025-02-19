#!/bin/bash

# Nvim
rm -rf $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# zsh
rm $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zsh
