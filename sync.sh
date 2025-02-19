#!/bin/bash

# Nvim
rm -rf $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# zsh
rm $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# GitHub cli
rm -rf $HOME/.config/gh
ln -s $HOME/dotfiles/.config/gh $HOME/.config/gh

# Cobra
rm $HOME/.cobra.yaml
ln -s $HOME/dotfiles/.cobra.yaml $HOME/.cobra.yaml

# Starship
rm $HOME/.config/starship.toml
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml

# Ghostty
rm -rf $HOME/.config/ghostty
ln -s $HOME/dotfiles/.config/ghostty $HOME/.config/ghostty

# Tmux
rm $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
