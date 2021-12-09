export EDITOR='nvim'

alias dotfiles='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias icat="kitty +kitten icat --align=left"
alias vim='nvim'

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin

set -o vi
. "$HOME/.cargo/env"
