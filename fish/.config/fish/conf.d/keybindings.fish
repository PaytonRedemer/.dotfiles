bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
bind --mode insert \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
