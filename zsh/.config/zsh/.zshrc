# Lines configured by zsh-newuser-install

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias p="sudo pacman"
alias ps="yay -S"
alias u="yay -Syu"
alias pr="yay -Rs"
alias diff="diff --color=auto"

#devour
alias jupyter-notebook="devour jupyter-notebook"
alias zathura="devour zathura"

alias h="history"
alias f='cd $(fd --type directory | fzf)'


alias e="$EDITOR"
alias v="$EDITOR"

alias g="git"
alias m="ncmpcpp"
alias r="ranger"
alias z="zathura"
