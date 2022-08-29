# PATH
set -e fish_user_paths # Removes path
set -U fish_user_paths $HOME/.local/bin $HOME/.config/scripts $fish_user_paths

set fish_greeting
# fenv source ~/.config/shell/profile
set TERMINAL "alacritty"
set EDITOR "nvim"
set BROWSER "firefox"

# Alias
source ~/.config/shell/aliasrc
