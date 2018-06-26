#!/usr/bin/env zsh

GREEN="\033[1;32m"
NOCOLOR="\033[0m"

git_clone() {
    src=$1; shift
    prj=$1; shift
    pts=(${(s:/:)prj})
    if [[ -z $pts[2] ]]; then
        prj="$(basename $PWD)/$pts[1]"
    fi
    echo git clone ${GREEN}$src$prj $*${NOCOLOR}
    git clone $src$prj $*
}

clone() {
    git_clone git@github.com: $*
}

lclone() {
    git_clone git@git.hiqdev.com: $*
}

pclone() {
    git_clone ssh://git.solex.me:222/git/ $*
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

# returns absolute path to file by given relative path
# also consider `realpath`
path() {
    echo "$("cd" "$(dirname "$1")" && pwd)/$(basename "$1")"
}

install_ripgrep() {
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
    sudo dpkg -i ripgrep_0.8.1_amd64.deb && rm ripgrep_0.8.1_amd64.deb
}
