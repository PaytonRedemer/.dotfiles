set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

starship init fish | source
zoxide init fish | source

set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux BROWSER firefox
set -Ux TERMINAL alacritty

# xdg
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CACHE_HOME "$HOME/.cache"

fish_add_path $HOME/.local/bin/
