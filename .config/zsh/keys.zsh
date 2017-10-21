#!/usr/bin/env zsh

# emacs key bindings
bindkey -e

bindkey ' '     magic-space             # also do history expansion on space

bindkey '\e[1~' beginning-of-line       # Home
bindkey '\e[2~' quoted-insert           # Ins
bindkey '\e[3~' delete-char             # Del
bindkey '\e[4~' end-of-line             # End
bindkey '\e[5~' beginning-of-history    # PageUp
bindkey '\e[6~' end-of-history          # PageDown

bindkey '^xe'   edit-command-line
