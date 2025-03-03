#!/bin/bash

# zsh
rm $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# SSH
rm $HOME/.ssh/config
ln -s $HOME/dotfiles/.ssh/config $HOME/.ssh/config

# Git
rm $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

# Nvim
rm -rf $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

# Tmux
rm $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Ghostty
rm -rf $HOME/.config/ghostty
ln -s $HOME/dotfiles/.config/ghostty $HOME/.config/ghostty

# Starship
rm $HOME/.config/starship.toml
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml

# GitHub cli
rm -rf $HOME/.config/gh
ln -s $HOME/dotfiles/.config/gh $HOME/.config/gh

# Cobra
rm $HOME/.cobra.yaml
ln -s $HOME/dotfiles/.cobra.yaml $HOME/.cobra.yaml
