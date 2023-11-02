#!/bin/sh

displays=$(xrandr | grep " connected " | awk '{ print$1 }')

feh --bg-fill ~/Pictures/Wallpapers/orion_nebula.jpg --no-fehbg

# Triple monitors
if echo "$displays" | grep -q "HDMI-0"; then
    xrandr --output DP-5 --auto --pos -1920x0 --output DP-0 --primary --mode 1920x1080 --rate 144 --pos 0x0 --output HDMI-0 --auto --pos 1920x0

# Laptop
elif echo "$displays" | grep -q "eDP1"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal

else
    echo "Invalid hostname! Make sure you add your hostname to the script!"
    exit 1
fi
