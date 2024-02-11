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
#start ~/dwm/keyd-indicator
start swayidle -w \
    timeout 300 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
    timeout 600 'systemctl suspend' \
    before-sleep 'swaylock -f -i ~/.config/sway/wallpaper_blurred.png; \
                  playerctl --all-players stop'
start wayland-pipewire-idle-inhibit
