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

function gerrit_aliases() {
	alias gitpush='git push --signed=if-asked origin HEAD:refs/for/master'
	alias gitpushwip='git push --signed=if-asked origin HEAD:refs/for/master%wip'
}

function setup_ericsson() {
	export GTE_VARS_FILE="/home/eonnraj/opt/.gte_deps_vars"
	source "/home/eonnraj/opt/config_gte_env.sh"
	gte_env

    gerrit_aliases

	function vnc() {
        if [[ -z "$1" ]]; then
            remmina -c ~/broccoli.remmina
        else
            remmina -c vnc://localhost:$1 --enable-fullscreen
        fi
	}

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
	setup_ericsson
}

function setup_mobserver() {
	generic
	source /repo/mob/cirrus-utils/shell-completion/bash/run_run_test-completion.bash
    export GTE_VARS_FILE=/repo/mob/opt/.gte_deps_vars
    source /repo/mob/opt/config_gte_env.sh
    gte_env
    export GTETOP=/repo/broccoli/gte-core
    export PATH=$GTETOP/bin:$PATH
    export GTE_HOST_INCLUDE_IPV4_LOOPBACK=100
    export GTE_DEFAULT_LOGDIR=$HOME/gte-logs
    export PATH=/repo/broccoli/testutils/usr/vcu:$PATH
    export PATH=/repo/broccoli/testutils/bin:$PATH
    export PATH=/repo/broccoli/cirrus-utils/bin:$PATH
    export PATH=/repo/broccoli/cirrus-utils/doc:$PATH

    function gtetop-here() {
        export P=$PATH 
        export GTETOP=$(pwd)
        export PATH=$(pwd)/bin:$P 
    }
	function vncserv() {
		if [[ $(hostname) == "seliics03003" ]]; then
			vncserver :7 -alwaysshared -localhost -geometry 1920x1080 -SecurityTypes None -- cinnamon-session
		else
			echo "only start vnc sessions on mob server"
		fi
	}
}

function setup_teamserver() {
    module add neovim/0.11.4
    module add emacs

    module use /proj/ltegte/modulefiles
    module add gte

    export GTETOP="/repo/$USER/git/gte-core"
    export GTE_DEFAULT_LOGDIR="/repo/$USER/csimlogs"
    export GTE_HOST_INCLUDE_IPV4_LOOPBACK=100
    
    PATH=$PATH:/proj/tgf_ki/dailytest/bin

	generic
	setup_nvim
    gerrit_aliases
}

# =================== main ===================

case $(hostname) in
	fedora)
		echo fedora
		setup_laptop ;;
	elx*)
		echo elx
		setup_elx ;;
	seliiuts03636)
		echo "this is a safe space, login here if you locked yourself out" ;;
    seliiuts03248)
		if [[ "$KITTY_SSH_SETUP" == "done" ]]; then
			echo teamserver
			setup_teamserver
		fi ;;
    seliics03003)
		if [[ "$KITTY_SSH_SETUP" == "done" ]]; then
			echo mobserver
			setup_mobserver
		fi ;;
	*)
		if [[ "$KITTY_SSH_SETUP" == "done" ]]; then
			echo generic
			setup_unknown_host
		fi ;;
esac
