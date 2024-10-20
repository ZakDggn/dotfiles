#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If running from tty1 start sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    export MOZ_ENABLE_WAYLAND=1
    export XDG_CURRENT_DESKTOP='sway:wlroots'
    export XDG_SCREENSHOTS_DIR=~/Pictures/Screenshots
    export XDG_CONFIG_HOME=~/.config
    exec sway &> .sway.log
fi
