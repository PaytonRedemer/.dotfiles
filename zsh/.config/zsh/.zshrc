# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b) '
PROMPT='%F{green}%n@%m%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'$'\n''-> '

# History
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000

# Options
stty stop undef # Disable ctrl-s to freeze terminal.
setopt autocd extendedglob histignorealldups interactive_comments nomatch share_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Load aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

if command -v bat &> /dev/null ; then
    alias cat="bat --paging=never"
fi

# Bindings
bindkey -v # vi mode
bindkey '^r' history-incremental-search-backward
bindkey -s '^o' '. ranger^M'

# requires zsh-fast-syntax-highlighting package from AUR
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
