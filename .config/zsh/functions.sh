#!/usr/bin/env zsh

clone() {
    echo git clone git@github.com:$*;
    git clone git@github.com:$*;
}

pclone() {
    echo git clone ssh://git.solex.me:222/git/$*;
    git clone ssh://git.solex.me:222/git/$*;
}

md() {
    mkdir -p "$@" && cd "$@"
}

cdls() {
    'cd' $1
    if [ $PWD != $HOME ]; then
        'ls' -F ${ls_options}
    fi
}

rehash() {
    source ~/.config/zsh/.zshrc
    builtin rehash
}

zc() {
    bc <<< "scale=5;$@"
}

z2() {
    bc <<< "scale=2;$@"
}

cdp() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]"
}

cdv() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]"
}

p() {
    if [ -z "$1" ]; then
        a=`cat ~/hostname`
    else
        a=$1
    fi
    command psql $a
}

composer() {
    if ! [ -x ~/sbin/composer ]; then
        wget https://getcomposer.org/installer -O ~/tmp/composer-setup.php
        php ~/tmp/composer-setup.php --install-dir=$HOME/sbin --filename=composer
        rm ~/tmp/composer-setup.php
    fi
    ~/sbin/composer $@
}
