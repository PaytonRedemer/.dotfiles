[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
monitorSetup.sh

# sys-tray
nm-applet &
blueman-applet &

# daemons
udiskie &
dunst &
picom &

# wm
exec dbus-launch qtile start
