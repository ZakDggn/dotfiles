# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Automatically append a slash to directory symlinks
bind 'set mark-symlinked-directories on'

# Aliases
alias cat='bat'
alias grep='grep --color=auto'
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

if [[ "$TERM" = "linux" ]]; then
  alias ls='ls --color=auto'
  alias ll='ls -lav --ignore=..'
  alias l='ls -lav --ignore=.?*'
  return
fi

alias ls='lsd'
alias ll='ls -lav --ignore-glob=..'   # show long listing of all except ".."
alias l='ls -lav --ignore-glob=.?*'   # show long listing but no hidden dotfiles except "."

# Initialise starship prompt
eval "$(starship init bash)"
