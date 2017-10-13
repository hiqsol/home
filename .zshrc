#! /usr/local/bin/zsh

source ${HOME}/.shrc
source ${HOME}/.aliases
source ${HOME}/.zaliases

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
export LSCOLORS="Gxfxcxdxbxegedabagacad"

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
setopt PROMPT_SUBST
login=`id -un`
hostname=`cat ~/hostname`
if [ $login = "sol" ]
then
    fg_color="%{$fg_no_bold[blue]%}"
    bg_color="%{$bg_bold[blue]%}"
else
    fg_color="%{$fg_no_bold[yellow]%}"
    bg_color="%{$bg_bold[yellow]%}"
fi
prompt_git() {
    branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    if [ ! -z $branch ]; then
        echo -n "%{$fg_no_bold[white]%}:%{$fg_bold[white]%}${branch}"
        TMP=`mktemp /tmp/zshXXXXX`
        changes=`git status -s;git log -n1 origin/${branch}..HEAD 2> "$TMP"`
        errors=`cat "$TMP"`
        rm $TMP
        if [ ! -z $errors ]
            then echo -n "%{$fg_bold[red]%}?"
        elif [ ! -z $changes ]
            then echo -n "%{$fg_bold[yellow]%}*"
        fi
    fi
}
PROMPT='${bg_color}%{$fg_no_bold[black]%}${login}@${hostname} %m %{$fg_bold[white]%}%* %{$bg_bold[black]%}${fg_color} %{$reset_color%}'
RPROMPT=$'%{$fg_bold[cyan]%}%~$(prompt_git)%{$reset_color%}'

