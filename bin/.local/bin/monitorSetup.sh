#!/bin/sh
hostname=$(cat /proc/sys/kernel/hostname)
case $hostname in
    main)
        xrandr --output DP-5 --auto --rotate left --pos 0x-270 --output DP-2 --primary --auto --rate 144 --pos 1080x0 --output HDMI-0 --auto --pos 3000x0
        bspc monitor DP-2 -d 1 2 3 4 5
        bspc monitor HDMI-0 -d 6 7 8
        bspc monitor DP-5 -d 9 10
        feh --bg-fill ~/Pictures/Wallpapers/hubble_sharpest_view_of_the_orion_nebula.jpg --no-fehbg
        ;;
    t480s)
        bspc monitor eDP1 -d 1 2 3 4 5 6 7 8 9 10
        feh --bg-fill ~/Pictures/Wallpapers/snow.jpg --no-fehbg
        ;;
    *)
        echo "Invalid hostname! Make sure you add your hostname to the script!"
        exit 1
        ;;
esac
