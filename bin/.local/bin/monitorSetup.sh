#!/bin/sh

displays=$(xrandr | grep " connected " | awk '{ print$1 }')

# Triple monitors
if echo "$displays" | grep -q "DP-5"; then
    xrandr --output DP-5 --auto --rotate left --pos 0x-270 --output DP-2 --primary --auto --rate 144 --pos 1080x0 --output HDMI-0 --auto --pos 3000x0
    bspc monitor DP-2 -d 1 2 3 4 5
    bspc monitor HDMI-0 -d 6 7 8
    bspc monitor DP-5 -d 9 10
    feh --bg-fill ~/Pictures/Wallpapers/hubble_sharpest_view_of_the_orion_nebula.jpg --no-fehbg

# Sunshine
elif echo "$displays" | grep -q "HDMI2"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
    bspc monitor eDP1 -d 1 2 3 4 5
    bspc monitor HDMI2 -d 6 7 8 9 10

# Laptop
elif echo "$displays" | grep -q "eDP1"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 10
    feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg

else
    echo "Invalid hostname! Make sure you add your hostname to the script!"
    exit 1
fi

bspc wm -r
