if status is-interactive
    # Commands to run in interactive sessions can go here
    set TERM xterm-256color
    set EDITOR nvim

    alias dotfiles 'git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
    alias vim nvim
end
