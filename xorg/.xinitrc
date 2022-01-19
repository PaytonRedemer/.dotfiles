[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr
wmname compiz # Fixes issue with java applications
feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg

# daemons
sxhkd &
dunst &
#picom &
#mpd &

# dwm
dwmbar &
exec dbus-launch dwm
