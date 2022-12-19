[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
# wmname compiz # Fixes issue with java applications
# vscode-fix.sh
monitorSetup.sh

# sys-tray
nm-applet &
blueman-applet &

# daemons
# sxhkd -c ~/.config/sxhkd/sxhkdrc &
udiskie &
dunst &
picom &
# mopidy &

# wm
# dwmbar &
# exec dbus-launch i3
exec dbus-launch qtile start
