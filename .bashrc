# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100  # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Automatically append a slash to directory symlinks
bind 'set mark-symlinked-directories on'

# Aliases
alias cat='bat'
alias ls='lsd'
alias ll='ls -lav'
alias l='ls -lv'
alias grep='grep --color=auto'
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

if [[ "$TERM" = "linux" ]]; then
  alias ls='ls --color=auto'
  alias ll='ls -lav'
  alias l='ls -lv'
  return
fi

# Start fish shell
exec fish
