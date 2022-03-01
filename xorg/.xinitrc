[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
wmname compiz # Fixes issue with java applications
monitorSetup.sh

nm-applet &

# daemons
sxhkd -c ~/.config/sxhkd/sxhkdrc.common &
#udiskie &
dunst &
#picom &
#mopidy &
#mpd &

exec dbus-launch bspwm
