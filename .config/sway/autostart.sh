#!/bin/bash

function start {
    grep -q "$1" <<<"$running" || "$@" &
}

running="$(ps aux)"

start dunst
start gammastep-indicator -l 51:0 -t 6500:3000
start nm-applet
start earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$'
start systembus-notify
start swayidle -w \
    timeout 300 'chayang -d 10 && swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
    timeout 600 'systemctl suspend' \
    before-sleep 'swaylock' \
    after-resume 'swaymsg "output * dpms on"'
start sway-audio-idle-inhibit > /dev/null
start lxpolkit
start wmname LG3D
start ~/.config/sway/low-battery-warning.sh 10 300
start playerctld daemon
