#! /usr/local/bin/zsh
### $Header: /usr/cvs/sol/.zshrc,v 1.9 2005/04/11 18:14:54 sol Exp $

. ${HOME}/.shrc
. ${HOME}/.aliases
. ${HOME}/.zaliases

### AUTOLOADS
autoload -U colors compinit promptinit zfinit zcalc edit-command-line
colors;compinit;promptinit;zfinit
zle -N edit-command-line

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
# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh-cache/
# Remove 'proxy' completion
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

### HISTORY
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_NO_STORE HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS HIST_EXPIRE_DUPS_FIRST

### PROMPT
setopt PROMPT_SUBST
ID=`id -un`
if [ $ID = "sol" ]
    then login="%{$fg_bold[white]%}%n"
    else login="%{$fg_bold[yellow]%}%n"
fi
if [ $ID = "root" ]
    then delim="%{$fg_bold[red]%}@"
    else delim="%{$fg_no_bold[white]%}@"
fi
if [ -z $WINDOW ]
    then scr_no=""
    else scr_no="%{$fg_no_bold[white]%}:%{$fg_bold[white]%}${WINDOW}"
fi
prompt_git() {
    git_br=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    if [ ! -z $git_br ]; then
        echo -n "%{$fg_no_bold[white]%}:%{$fg_bold[white]%}${git_br}"
        git_st=`git status -suno`
        if [ ! -z $git_st ]
            then echo -n "%{$fg_no_bold[yellow]%}*"
        fi
    fi
}
PROMPT='%B%{$fg_bold[blue]%}%*%b ${login}${delim}%{$fg_bold[white]%}%m${scr_no} > %{$reset_color%}'
RPROMPT=$'%{$fg_bold[blue]%}%~$(prompt_git)%{$reset_color%}'

