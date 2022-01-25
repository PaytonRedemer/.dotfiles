[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
wmname compiz # Fixes issue with java applications

nm-applet &

# daemons
#sxhkd &
udiskie &
dunst &
#picom &
#mpd &

exec dbus-launch bspwm
