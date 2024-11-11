set -g fish_greeting
if status is-login
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
        exec start-sway &> .sway.log
    end
end
if status is-interactive
    alias cat='bat'
    alias ls='lsd'
    alias l='ls -lv'
    alias ll='ls -lav'
    alias grep='grep --color=auto'
    alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    if string match -eq kitty $TERM
        alias clear='printf "\e[H\e[3J"'
        alias sshpi='kitten ssh pi@192.168.1.10'
    end
    if test $TERM = linux
        fish_config theme choose Old\ School
    else
        starship init fish | source
    end
end
