# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias ls="lsd"
alias ll='ls -lav --ignore-glob=..'   # show long listing of all except ".."
alias l='ls -lav --ignore-glob=.?*'   # show long listing but no hidden dotfiles except "."
alias cat="bat"
