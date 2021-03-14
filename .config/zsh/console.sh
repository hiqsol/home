install_console() {
    sudo apt install \
        curl ripgrep \
        zsh tmux \
        npm python3-pip
}

composer() {
    file="$HOME/sbin/composer"

    if ! [ -x $file ]; then
        tmp="$HOME/tmp/composer-setup.php"
        wget https://getcomposer.org/installer -O $tmp
        php $tmp --install-dir=$HOME/sbin --filename=composer
        rm $tmp
        $file self --1
    fi

    $file $@
}

composer2() {
    file="$HOME/sbin/composer2"

    if ! [ -x $file ]; then
        tmp="$HOME/tmp/composer-setup.php"
        wget https://getcomposer.org/installer -O $tmp
        php $tmp --install-dir=$HOME/sbin --filename=composer2
        rm $tmp
        $file self --2
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

nvim() {
    file="$HOME/sbin/nvim"

    if [ ! -x $file ]; then
        curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -o $file
        chmod a+x $file
    fi

    $file $@
}

vim8() {
    file="$HOME/sbin/vim8"

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
        cd ~/tmp
        wget https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz
        tar zvxvf hub-linux-amd64-2.14.2.tgz
        sudo ./hub-linux-amd64-2.14.2/install
        cp ./hub-linux-amd64-2.14.2/etc/hub.zsh_completion ~/.config/zsh/completion/_hub
        cd -
    fi

    $file $@
}

install_php_modules() { apt_php_modules install $@ }
remove_php_modules()  { apt_php_modules remove $@ }

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

get_php_version() {
    ver=`php -v`
    echo ${ver:4:3}
}

