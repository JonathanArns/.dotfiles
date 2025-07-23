# ============ reusable snippets ============

function generic() {
	PROMPT_COMMAND='PS1_PATH=$(sed "s:\([^/\.]\)[^/]*/:\1/:g" <<< ${PWD/#$HOME/\~})'
	export PS1="\[\033[38;5;190m\]\u\[$(tput sgr0)\]@\h \[\033[38;5;34m\]\$PS1_PATH\[$(tput sgr0)\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')> "

	export EDITOR='vim'
	set -o vi

	alias la='ls -la'
	alias ll='ls -l'
	alias lat='ls -lat'
	alias llt='ls -lt'

	PATH=$PATH:~/.local/bin
}

function setup_rust() {
	PATH=$PATH:~/.cargo/bin
	source "$HOME/.cargo/env"
}

function setup_kitty() {
	alias icat='kitty +kitten icat --align=left'
	alias ssh='kitty +kitten ssh'
}

function setup_nvim() {
	alias vim='nvim'
	export EDITOR='nvim'
	PATH=$PATH:~/.local/share/nvim/mason/bin
}

function setup_golang() {
	PATH=$PATH:~/go/bin
	GOPATH=~/workspace
}

function setup_dotfiles() {
	alias dotfiles='git --git-dir ~/.dotfiles/.git --work-tree=$HOME -c user.name="JonathanArns" -c user.email="jonathan.arns@googlemail.com"'
}

function setup_ericsson() {
	export GTE_VARS_FILE="/home/eonnraj/opt/.gte_deps_vars"
	source "/home/eonnraj/opt/config_gte_env.sh"
	gte_env

	alias vnc='vncviewer -RemoteResize=0 -FullScreen -Maximize -FullColour=0 -DotWhenNoCursor localhost:8'

	# for building elp from source
	export ELP_EQWALIZER_PATH=/home/eonnraj/workspace/eqwalizer/eqwalizer/target/scala-3.6.4/eqwalizer.jar
}

# ========== host specific configs ===========

function setup_laptop() {
	generic
	setup_kitty
	setup_dotfiles
	setup_nvim
	setup_rust
	setup_golang
}

function setup_unknown_host() {
	generic
}

function setup_elx() {
	generic
	setup_kitty
	setup_dotfiles
	setup_nvim
	setup_rust
	setup_golang
}

# =================== main ===================

case $(hostname) in
	fedora)
		setup_laptop ;;
	"elx*")
		setup_elx ;;
	*)
		setup_unknown_host ;;
esac
