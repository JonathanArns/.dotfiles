export EDITOR='nvim'

alias dotfiles='git --git-dir ~/.dotfiles/.git --work-tree=$HOME -c user.name="JonathanArns" -c user.email="jonathan.arns@googlemail.com"'
alias icat='kitty +kitten icat --align=left'
alias ssh='kitty +kitten ssh'
alias vim='nvim'
alias la='ls -la'
alias ll='ls -l'
alias lat='ls -lat'
alias llt='ls -lt'

PATH=$PATH:~/.local/bin
PATH=$PATH:~/.cargo/bin
PATH=$PATH:~/go/bin
PATH=$PATH:~/.local/share/nvim/mason/bin

source "$HOME/.cargo/env"

set -o vi

PROMPT_COMMAND='PS1_PATH=$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<< ${PWD/#$HOME/\~})'
export PS1="\[\033[38;5;190m\]\u\[$(tput sgr0)\]@\h \[\033[38;5;34m\]\$PS1_PATH\[$(tput sgr0)\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')> "
