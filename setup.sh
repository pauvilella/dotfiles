#!/bin/bash

# zsh
echo "Setting up ZSH..."
rm $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# SSH
echo "Setting up SSH..."
rm $HOME/.ssh/config
ln -s $HOME/dotfiles/.ssh/config $HOME/.ssh/config

# Git
echo "Setting up Git..."
rm $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

# Nvim
echo "Setting up NeoVim..."
rm -rf $HOME/.config/nvim
ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

# Claude
echo "Setting up Claude..."
rm -rf $HOME/.config/claude
ln -s $HOME/dotfiles/config/claude $HOME/.config/claude
chmod +x $HOME/.config/claude/scripts/*

# Tmux
echo "Setting up Tmux..."
rm $HOME/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Ghostty
echo "Setting up Ghostty..."
rm -rf $HOME/.config/ghostty
ln -s $HOME/dotfiles/config/ghostty $HOME/.config/ghostty

# Atuin
echo "Setting up Atuin..."
rm $HOME/.config/atuin/config.toml
ln -s $HOME/dotfiles/config/atuin/config.toml $HOME/.config/atuin/config.toml

# Starship
echo "Setting up Starship..."
rm $HOME/.config/starship.toml
ln -s $HOME/dotfiles/config/starship.toml $HOME/.config/starship.toml

# GitHub CLI
echo "Setting up GitHub CLI..."
rm -rf $HOME/.config/gh
ln -s $HOME/dotfiles/config/gh $HOME/.config/gh
echo "Merging GitHub hosts configuration..."
$HOME/dotfiles/scripts/merge-gh-hosts.sh

# Cobra
echo "Setting up Cobra..."
rm $HOME/.cobra.yaml
ln -s $HOME/dotfiles/.cobra.yaml $HOME/.cobra.yaml

## Scripts ##
echo "Loading shell scripts..."
rm -rf $HOME/.config/scripts
mkdir -p $HOME/.config/scripts
ln -s $HOME/dotfiles/scripts/brew-clean.sh $HOME/.config/scripts/brew-clean.sh
chmod +x $HOME/.config/scripts/brew-clean.sh

# Brew
echo "Setting up Brew and installing formulas..."
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Installing now..."
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Ensure Homebrew is available in the current session
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)"
else
  echo "Homebrew is already installed!"
fi

source $HOME/.config/scripts/brew-clean.sh
brew-clean

echo "Updating brew..."
brew update
echo "Installing brew taps, formulas and casks..."
brew bundle --file=$HOME/dotfiles/Brewfile
echo "Upgrading brew"
brew upgrade

echo "All done! :)"
