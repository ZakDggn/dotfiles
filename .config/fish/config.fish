if status is-interactive
    set -g fish_greeting
    alias cat='bat'
    alias ls='lsd'
    alias l='ls -lv'
    alias ll='ls -lav'
    alias grep='grep --color=auto'
    alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    starship init fish | source
end
