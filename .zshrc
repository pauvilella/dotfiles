export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## Startship ##
eval "$(starship init zsh)"

## Pyenv ##
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## NVM ##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Kubernetes ##
export KUBE_EDITOR=/opt/homebrew/bin/nvim
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source <(kubectl completion zsh)
compdef __start_kubectl k
# Tell zsh to use the same autocomplete for kubecolor too
compdef kubecolor=kubectl

## Golang ##
export PATH="$PATH:$(go env GOPATH)/bin"

## Flux ##
command -v flux >/dev/null && . <(flux completion zsh)

## Atuin ##
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

## Aliases ##
alias cat='bat --plain --paging=never'
alias k='kubectl'
alias kubectl='kubecolor'
alias kc='kubectx'
alias kn='kubens'
alias git-home='cd $(git home)'
alias eg='env | grep -i'
alias pauvilella='cd $HOME/git/personal/pauvilella/'
alias dotfiles='cd $HOME/dotfiles/'
alias vim='nvim'

## Load Secret env vars ##
source $HOME/.zshrc.secrets

### Work Specific ###
source $HOME/.work/.zshrc
