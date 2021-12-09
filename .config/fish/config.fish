if status is-interactive
    # Commands to run in interactive sessions can go here
    set TERM xterm-256color
    set EDITOR nvim
    set -gx PATH $PATH ~/.local/bin
    set -gx PATH $PATH ~/go/bin
    set -gx PATH $PATH ~/.cargo/bin

    alias dotfiles 'git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
    alias vim nvim
end
