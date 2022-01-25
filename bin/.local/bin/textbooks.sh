#!/bin/sh

selected=$(ls ~/Textbooks | rofi -dmenu -p "Textbooks")

zathura ~/Textbooks/$selected

