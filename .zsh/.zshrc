#! /usr/local/bin/zsh

source ~/.shrc
source ~/.aliases
source ~/.zsh/aliases.sh

### AUTOLOADS
fpath=(~/.zsh/completion $fpath)
autoload -U colors compinit promptinit zfinit zcalc edit-command-line select-word-style
colors;compinit -i;promptinit;zfinit
zle -N edit-command-line
select-word-style bash

### KEYS
bindkey -e                              # emacs key bindings
bindkey ' '     magic-space             # also do history expansion on space

bindkey '\e[2~' quoted-insert           \
        '\e[3~' delete-char             \
        '\e[5~' beginning-of-history    \
        '\e[6~' end-of-history          \
        '\e[1~' beginning-of-line       \
        '\e[4~' end-of-line

bindkey '^xe'   edit-command-line

### DIFFERENT OPTIONS
setopt AUTO_CD CDABLE_VARS
setopt MULTIOS ### multi redirection: echo > 1 > 2
setopt CORRECT AUTO_MENU EXTENDED_GLOB

### COMPLETION
# Allow key-driven interface, highlight active option
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh-cache/
# Remove 'proxy' completion
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

### HISTORY
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_NO_STORE HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS HIST_EXPIRE_DUPS_FIRST

### PROMPT
ZLE_RPROMPT_INDENT=0
source ~/.vim/plugged/promptline.vim/autoload/promptline/slices/git_status.sh
source ~/.zsh/prompt.sh
