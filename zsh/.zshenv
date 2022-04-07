typeset -U PATH path

path=("$HOME/.local/bin" "$HOME/.config/scripts" "$path[@]")
export PATH

# default programs
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export ZDOTDIR="$HOME/.config/zsh"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# program settings
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_DATA_DIRS=usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
export QT_QPA_PLATFORMTHEME=qt5ct
export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE=-
