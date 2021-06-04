
install_desktop() {
    install_console
    sudo apt install konsole openvpn openssh-server \
        keepassxc \
        arandr rhythmbox qt5-style-kvantum \
        fonts-terminus gnome-font-viewer fbreader

    add_startup_apps
    add_screenlayout

    install_chrome
    install_zoom
    install_skype
    install_slack
    install_telegram
}

add_startup_apps() {
    # snap run skype
}

add_screenlayout() {
    # FROM ~/.config/screenlayout
    # TO /usr/share/sddm/scripts/Xsetup
}

install_skype() {
    tmp="$HOME/Downloads/skypeforlinux-64.deb"
    if ! [ -x $tmp ]; then
        # XXX wget -c doesn't work at their server :-/
        wget https://go.skype.com/skypeforlinux-64.deb -O $tmp
    fi
    sudo dpkg -i $tmp
    rm $tmp
}

install_slack() {
    sudo snap install --classic slack
}

Telegram() {
    file="$HOME/sbin/Telegram/Telegram"
    if ! [ -x $file ]; then
        install_telegram
    fi

    $file $@
}

install_telegram() {
    cd ~/sbin
    wget -c https://telegram.org/dl/desktop/linux
    tar xf tsetup.*.tar.xz
    cd -
}

install_chrome() {
    wget -c -O ~/tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i ~/tmp/chrome.deb
}

install_dropbox() {
    cd ~
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    cd -
    ~/.dropbox-dist/dropboxd &
}

install_zoom() {
	sudo apt install -y libegl1-mesa libgl1-mesa-glx libxcb-xtest0
    wget -c -O ~/tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
	sudo dpkg -i ~/tmp/zoom.deb
}

