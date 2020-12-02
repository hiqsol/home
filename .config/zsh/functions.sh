#!/usr/bin/env zsh

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

git_clone() {
    src=$1; shift
    prj=$1; shift
    if [[ "$#" -ne 0 ]]; then
        dst=$1; shift
    else
        dst=""
    fi
    pts=(${(s:/:)prj})
    if [[ -z $pts[2] ]]; then
        prj="$(basename $PWD)/$pts[1]"
        dir=$pts[1]
    else
        dir=$pts[2]
    fi
    echo git clone ${GREEN}$src$prj ${YELLOW}$dst $*${NOCOLOR}
    git clone $src$prj $dst $*
    if [[ -z $dst ]]; then
        dst=$dir
    fi
    cd $dst
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
cdv() {
    pts=(${(s:/:)PWD})
    if [[ -z $pts[7] ]]; then
        pts[7]='hiqdev'
    fi
    if [[ -z $pts[6] ]]; then
        pts[6]='vendor'
    fi
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]/$pts[6]/$pts[7]"
}

# cd to /home/user/prj/organization/PROJECT
cdp() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]"
}

# cd to /home/user/prj/organization/PROJECT/core
cdc() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]/$pts[5]/core"
}

# cd to /home/user/prj/ORGANIZATION
cdo() {
    pts=(${(s:/:)PWD})
    cd "/$pts[1]/$pts[2]/$pts[3]/$pts[4]"
}

psql_default() {
    if [ -z "$1" ]; then
        name=`cat $HOME/hostname`
    else
        name=$1
        shift
    fi
    command psql $name "$@"
}

docker_psql_default() {
    if [ -z "$1" ]; then
        host=pgsql
    else
        host=$1
        shift
    fi
    if [ -z "$1" ]; then
        name=postgres
    else
        name=$1
        shift
    fi
    psql -h $host -U postgres $name "$@"
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

nginx-proxy-common() {
    # cd ~/prj/vendor
    # nginx-proxy-common start 1.2.3.4
    # PROFIT
    dir="$HOME/prj/hiqdev/nginx-proxy-common"
    file="$dir/nginx-proxy-common"

    if ! [ -d $dir ]; then
        git clone git@github.com:hiqdev/nginx-proxy-common $dir
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

    $file --add-metadata $@
}

drun() {
    docker run -it --rm --name run -v "$HOME":"$HOME" -w "$PWD" $@
}

dphp54() {
    drun php:5.4-cli php $@
}

dphp71() {
    drun php:7.1-cli php $@
}

dphp() {
    ver=$1;shift
    drun "php:$ver-cli" php $@
}

dbash() {
    docker exec -it $1 bash -c "stty cols $COLUMNS rows $LINES && bash";
}

dpsql() {
    docker exec -it --user postgres $1 sh -c "stty cols $COLUMNS rows $LINES && psql $2";
}

dcbash() {
    docker-compose exec $1 bash -c "stty cols $COLUMNS rows $LINES && bash";
}

dcpsql() {
    docker-compose exec --user postgres pgsql sh -c "stty cols $COLUMNS rows $LINES && psql $@";
}

nvim() {
    file="$HOME/bin/nvim"

    if [ ! -x $file ]; then
        curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o $file
        chmod a+x $file
    fi

    $file $@
}

vim8() {
    file="$HOME/bin/vim8"

    if [ ! -x $file ]; then
        url=`curl --silent "https://api.github.com/repos/vim/vim-appimage/releases/latest" | jq -r 'first(.assets[].browser_download_url)'`
        curl -L $url -o $file
        chmod a+x $file
    fi

    $file $@
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
    wget https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz
    tar zvxvf hub-linux-amd64-2.14.2.tgz
    sudo ./hub-linux-amd64-2.14.2/install
    cp ./hub-linux-amd64-2.14.2/etc/hub.zsh_completion ~/.config/zsh/completion/_hub
    cd -
}

# returns absolute path to file by given relative path
# also consider `realpath`
path() {
    echo "$("cd" "$(dirname "$1")" && pwd)/$(basename "$1")"
}

get_php_version() {
    ver=`php -v`
    echo ${ver:4:3}
}

apt_php_modules() {
    cmd=$1
    ver=$2
    if [[ -z $cmd ]]; then
        cmd="install"
    fi
    if [[ -z $ver ]]; then
        ver=$(get_php_version)
    fi
    echo "PHP $ver"

    if [[ $ver = "7.4" ]]; then
        opcache=""
    else
        opcache="php$ver-opcache"
    fi
    if [[ $ver = "7.4" ]]; then
        dom=""
    else
        dom="php$ver-dom"
    fi
    sudo apt $cmd -y "php$ver-cli" "php$ver-common" \
        "php$ver-bcmath" "php$ver-gmp" \
        $dom $opcache \
        "php$ver-imap" "php$ver-mailparse" \
        "php$ver-curl" "php$ver-imap" "php$ver-intl" \
        "php$ver-json" "php$ver-mbstring" \
        "php$ver-readline" "php$ver-soap" "php$ver-xml" "php$ver-zip"
}

install_php_modules() {
    apt_php_modules install $@
}

remove_php_modules() {
    apt_php_modules remove $@
}

install_desktop() {
    sudo apt install konsole openssh-server \
        rhythmbox \
        qt5-style-kvantum arandr
}

linux_version() {
    command -v lsb_version && lsb_version -a
    cat /etc/*release
    cat /etc/issue*
    cat /proc/version
}
