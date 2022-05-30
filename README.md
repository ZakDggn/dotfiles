# Dotfiles

## Packages

i3-wm
i3status
i3lock
xss-lock
dmenu
nitrogen
vim
git
alacritty
lightdm
eos-lightdm-slick-theme
firefox
redshift
picom

## Laptop packages

light
tlp
tlp-rdw

## Setup commands

- Disable PC Speaker: ```echo 'blacklist pcspkr' | sudo tee /etc/modprobe.d/nobeep.conf```
- Enable lightdm: ```sudo systemctl enable lightdm.service```
- Make alacritty the default terminal: ```echo 'TERMINAL=alacritty' | sudo tee -a /etc/environment```
- Set a background with nitrogen: ```nitrogen --save --set-auto path/to/background

## Laptop setup commands

- Add user to video group to allow light to adjust the backlight brightness: ```sudo usermod -aG video username```
- Enable tlp and tlp-rdw: ```sudo systemctl enable tlp.service && sudo systemctl mask systemd-rfkill.service && sudo systemctl mask systemd-rfkill.socket && sudo systemctl enable NetworkManager-dispatcher.service```
