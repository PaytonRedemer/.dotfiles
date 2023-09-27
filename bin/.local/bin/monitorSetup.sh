#!/bin/sh

displays=$(xrandr | grep " connected " | awk '{ print$1 }')

feh --bg-fill ~/Pictures/Wallpapers/orion_nebula.jpg --no-fehbg

# Triple monitors
if echo "$displays" | grep -q "HDMI-0"; then
    xrandr --output DP-5 --auto --pos -1920x0 --output DP-0 --primary --mode 1920x1080 --rate 144 --pos 0x0 --output HDMI-0 --auto --pos 1920x0

# Sunshine
elif echo "$displays" | grep -q "HDMI2"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# Laptop
elif echo "$displays" | grep -q "eDP1"; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal

else
    echo "Invalid hostname! Make sure you add your hostname to the script!"
    exit 1
fi
