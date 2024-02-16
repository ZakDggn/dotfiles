#!/bin/bash

function start {
  grep -q "$1" <<<"$running" || "$@" &
}

running="$(ps aux)"

start waybar -c ~/.config/waybar/config-hyprland -s ~/.config/waybar/style-hyprland.css
start dunst
start gammastep-indicator -l 51:0 -t 6500:3000
start nm-applet
start earlyoom -r 3600 -n --avoid '(^|/)(init|systemd.*|Xorg|sshd)$'
start systembus-notify
#start ~/dwm/keyd-indicator
start swayidle -w \
    timeout 300 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
    timeout 600 'systemctl suspend' \
    before-sleep 'playerctl --all-players stop; swaylock'
start wayland-pipewire-idle-inhibit
start lxsession
