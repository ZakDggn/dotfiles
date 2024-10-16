#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# If running from tty1 start sway
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  if [[ "${hostname}" -eq "nixos-desktop" ]]; then
    exec sway --unsupported-gpu &> .sway.log
  else
    exec start-sway &> .sway.log
  fi
fi
