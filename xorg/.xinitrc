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
emacs --daemon --eval '(load-file "~/.config/emacs/init.el")' &

# wm
exec dbus-launch i3
