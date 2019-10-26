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
cdvo() {
    pts=(${(s:/:)PWD})
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
        a=`cat $HOME/hostname`
    else
        a=$1
    fi
    command psql $a
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

    $file $@
}

drun() {
    docker run -it --rm --name run -v "$PWD":/app -w /app $@
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
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
    sudo dpkg -i ripgrep_0.10.0_amd64.deb && rm ripgrep_0.10.0_amd64.deb
}

install_php_modules() {
    ver=$1
    if [[ -z $ver ]]; then
        ver="7.3"
    fi
    sudo apt install -y "php$ver-bcmath" "php$ver-curl" "php$ver-dom" "php$ver-imap" "php$ver-mbstring" "php$ver-soap"
}
