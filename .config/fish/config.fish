if status is-interactive
    set -g fish_greeting
    alias cat='bat'
    alias ls='lsd'
    alias l='ls -lv'
    alias ll='ls -lav'
    alias grep='grep --color=auto'
    alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    alias conda-init='eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source && conda activate env'
    if string match -eq kitty $TERM
        alias clear='printf "\e[H\e[3J"'
    end
    starship init fish | source
end

