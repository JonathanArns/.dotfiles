# .dotfiles

Setup on a new machine:
Please note that any files that exist in your home directory will be overwritten by the files from this repository if present.
```bash
git clone git@github.com:JonathanArns/.dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
dotfiles reset --hard
```
