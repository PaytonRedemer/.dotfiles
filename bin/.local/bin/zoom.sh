#!/bin/sh

INPUT=$(echo "Topics in Geometry
Discrete Math
Regression Analysis
Brit Lit" | rofi -dmenu)


case $INPUT in

    "Topics in Geometry")
    xdg-open https://umsystem.zoom.us/j/94589491269?pwd=dncycGY1bGhBV0NCby8zT2NRTHRqUT09
    ;;

    "Discrete Math")
    xdg-open https://umsystem.zoom.us/j/94241234278?pwd=QVEzYUxXM3lVUXZkTXFaWWZ5WmNPUT09
    ;;

    "Regression Analysis")
    xdg-open https://umsystem.zoom.us/j/92298833508?pwd=TmNocjlwdkhKcU0rejd0N1Jpb2pTUT09
    ;;
    "Brit Lit")
    xdg-open https://umsystem.zoom.us/j/99690296844?pwd=WEFuTEg4UGV2cjNaZWp4bjBLb09Xdz09
    ;;

esac





