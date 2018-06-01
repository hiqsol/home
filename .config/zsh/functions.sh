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

# cd to /home/user/prj/organization/project/vendor/organization/PROJECT
cdvp() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]/$pts[6]/$pts[7]/$pts[8]"
}

# cd to /home/user/prj/organization/project/vendor/ORGANIZATION
cdvo() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]/$pts[6]/$pts[7]"
}

# cd to /home/user/prj/organization/PROJECT
cdp() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]"
}

# cd to /home/user/prj/ORGANIZATION
cdo() {
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

hub() {
    file="/usr/local/bin/hub"

    if [ ! -x $file ]; then
        install_hub
    fi

    $file $@
}

install_hub() {
    cd ~/tmp
    wget https://github.com/github/hub/releases/download/v2.3.0/hub-linux-amd64-2.3.0.tgz
    tar zvxvf hub-linux-amd64-2.3.0.tgz
    sudo ./hub-linux-amd64-2.3.0/install
    cp ./hub-linux-amd64-2.3.0/etc/hub.zsh_completion ~/.config/zsh/completion/_hub
}
