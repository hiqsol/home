#!/usr/bin/env zsh

clone() {
    echo git clone git@github.com:$*;
    git clone git@github.com:$*;
}

lclone() {
    echo git clone git@git.hiqdev.com:$*;
    git clone git@git.hiqdev.com:$*;
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
    source $HOME/.config/zsh/.zshrc
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
        a=`cat $HOME/hostname`
    else
        a=$1
    fi
    command psql $a
}

composer() {
    file="$HOME/sbin/composer"

    if ! [ -x $file ]; then
        tmp="$HOME/tmp/composer-setup.php"
        wget https://getcomposer.org/installer -O $tmp
        php $tmp --install-dir=$HOME/sbin --filename=composer
        rm $tmp
    fi

    $file $@
}

certbot-auto() {
    file="$HOME/sbin/certbot-auto"

    if ! [ -x $file ]; then
        wget https://dl.eff.org/certbot-auto -O $file
        chmod a+x $file
    fi

    $file $@
}

ydl() {
    file="$HOME/sbin/youtube-dl"

    if [ ! -e "$file" ]; then
        wget https://yt-dl.org/downloads/latest/youtube-dl -O $file
        chmod a+rx $file
    fi

    $file $@
}

nvim() {
    file="/usr/bin/nvim"

    if [ ! -e "$file" ]; then
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt-get install neovim
        sudo apt-get install python-dev python-pip python3-dev python3-pip
    fi

    $file $@
}

bashinto() {
    docker exec -it $1 bash -c "stty cols $COLUMNS rows $LINES && bash";
}
