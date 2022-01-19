# Lines configured by zsh-newuser-install

autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v



autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

alias ls="ls -ahN --color=auto --group-directories-first"
alias grep="grep -i --color=auto"

alias p="sudo pacman"
alias ps="sudo pacman -S"
alias u="sudo pacman -Syu"
alias pr="sudo pacman -Rs"
alias diff="diff --color=auto"

#devour
alias jupyter-notebook="devour jupyter-notebook"


alias h="history"



alias e="$EDITOR"
alias v="$EDITOR"

alias g="git"
alias m="ncmpcpp"
alias r="ranger"
alias z="zathura"

alias school="$HOME/School/Spring_2021"
alias textbooks="$HOME/Textbooks"
