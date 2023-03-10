#!/bin/sh

displays=$(xrandr | grep " connected " | awk '{ print$1 }')

# Triple monitors
if echo "$displays" | grep -q "HDMI-0"; then
    xrandr --output DP-3 --auto --pos -1920x0 --output DP-0 --primary --auto --rate 144 --pos 0x0 --output HDMI-0 --auto --pos 1920x0
    feh --bg-fill ~/Pictures/Wallpapers/hubble_sharpest_view_of_the_orion_nebula.jpg --no-fehbg

# Sunshine
elif echo "$displays" | grep -q "HDMI2"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
    feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg

# Laptop
elif echo "$displays" | grep -q "eDP1"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg

else
    feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg
    echo "Invalid hostname! Make sure you add your hostname to the script!"
    exit 1
fi
