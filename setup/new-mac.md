# Setup a new Mac

## Introduction

This guide will walk through the steps to setup a new Mac for development.

## Initial steps

Set the hostname:

- `sudo scutil --set LocalHostName <my-hostname>`
- `sudo scutil --set HostName <my-hostname>`
- `sudo scutil --set ComputerName <my-hostname>`

Set keyboard speed:

- `defaults write -g KeyRepeat -int 1.15`
- `defaults write -g InitialKeyRepeat -int 20`

Install and update mac software:

- `softwareupdate --install-rosetta`
- `xcode-select --install`

Oy My Zsh:

- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my- zsh/custom}/plugins/zsh-syntax-highlighting`

## Create a new SSH key and upload it to the Github Profile

1. Create a new SSH key: `ssh-keygen -t ed25519 -C <my-hostname>`
2. Copy public key to clipboard: `pbcopy < ~/.ssh/id_ed25519.pub`
3. Add it to the Github Profile.
4. Createa a GPG key for signing commits. Following GitHub's [instructions](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key).

## Create Git repo structure

Inside the `git/work` folder I'll add the Work specific orgs, and inside the `git/personal` folder the personal specific orgs.

- `mkdir -p $HOME/git/work`
- `mkdir -p $HOME/git/personal

## Setup Dotfiles

Setup dotfiles:

- `cd $HOME && git clone git@github.com:pauvilella/dotfiles.git`
- `cd $HOME/dotfiles`
- `chmod +x setup.sh`
- `./setup.sh`
