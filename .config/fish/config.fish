if status is-interactive
    set -g fish_greeting
    alias cat='bat'
    alias ls='lsd'
    alias l='ls -lv'
    alias ll='ls -lav'
    alias grep='grep --color=auto'
    alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    alias lvim='NVIM_APPNAME=nvim-lazyvim nvim'
    alias conda-init='eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source && conda activate env'
    starship init fish | source
end

