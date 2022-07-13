#!/usr/bin/env bash

# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

# exit if dos2unix is not installed
command -v dos2unix >/dev/null 2>&1 || {
    echo >&2 "dos2unix is not installed; aborting installer.";
    exit 1;
}

# TODO: make install.sh files and separate apart this ball of mud

# copy bash aliases
cp -u ./config/pop-os/bash/.bash_aliases ~/
dos2unix ~/.bash_aliases
chmod 644 ~/.bash_aliases

# backup original bashrc (in case anything goes wrong)
cp -u ~/.bashrc ~/.bashrc_backup

# copy bashrc
cp -u ./config/pop-os/bash/.bashrc ~/
dos2unix ~/.bashrc
chmod 644 ~/.bashrc

# copy git config files
cp -u ./config/pop-os/git/.gitconfig ~/
dos2unix ~/.gitconfig
chmod 644 ~/.gitconfig

# copy totem thumbnailer file
#sudo mkdir -p /usr/share/thumbnailers/
#sudo mv /usr/share/thumbnailers/totem.thumbnailer /usr/share/thumbnailers/totem.thumbnailer.backup
#sudo cp -u ./config/pop-os/thumbnailer/totem.thumbnailer /usr/share/thumbnailers/
#sudo dos2unix /usr/share/thumbnailers/totem.thumbnailer
#sudo chmod 644 /usr/share/thumbnailers/totem.thumbnailer

# copy mpv input config file to it's flatpak config directory
mkdir -p ~/.var/app/io.mpv.Mpv/config/mpv
cp -u ./config/pop-os/mpv/input.conf ~/.var/app/io.mpv.Mpv/config/mpv/
dos2unix ~/.var/app/io.mpv.Mpv/config/mpv/input.conf
chmod 644 ~/.var/app/io.mpv.Mpv/config/mpv/input.conf

# make nvim directory if it doesn't exist
mkdir -p ~/.config/nvim

# copy nvim config files
cp -ur ./config/pop-os/nvim/general ~/.config/nvim/
cp -u ./config/pop-os/nvim/init.vim ~/.config/nvim/
find ~/.config/nvim -type f -print0 | xargs -0 dos2unix --
find ~/.config/nvim -type f -print0 | xargs -0 chmod 644 --

# copy easyeffects profile config file to it's flatpak config directory
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output
cp -u ./config/pop-os/easyeffects/nyancat_easyeffects.json ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/
dos2unix ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json
chmod 644 ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json

# copy qbittorrent config files
mkdir -p ~/nyancat/.config/qBittorrent/
cp -u ./config/pop-os/qbittorrent/qBittorrent.conf ~/nyancat/.config/qBittorrent/
dos2unix ~/nyancat/.config/qBittorrent/qBittorrent.conf
chmod 644 ~/nyancat/.config/qBittorrent/qBittorrent.conf

cp -u ./config/pop-os/qbittorrent/darkstylesheet.qbtheme ~/nyancat/.config/qBittorrent/
# note: binary file darkstylesheet.qbtheme does not need dos2unix conversion
chmod 644 ~/nyancat/.config/qBittorrent/darkstylesheet.qbtheme

unzip ./config/pop-os/qbittorrent/ipfilter_v0153.zip -d ./config/pop-os/qbittorrent/
cp -u ./config/pop-os/qbittorrent/ipfilter.dat ~/nyancat/.config/qBittorrent/
dos2unix ~/nyancat/.config/qBittorrent/ipfilter.dat
chmod 644 ~/nyancat/.config/qBittorrent/ipfilter.dat

# copy vim config files
cp -u ./config/pop-os/vim/.vimrc ~/
dos2unix ~/.vimrc
chmod 644 ~/.vimrc

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
    mkdir -p ~/.config/Code/User/

    # copy vscode keybindings config
    cp ./config/pop-os/vscode/keybindings.json ~/.config/Code/User/
    dos2unix ~/.config/Code/User/keybindings.json
    chmod 644 ~/.config/Code/User/keybindings.json

    # copy vscode settings config
    cp ./config/pop-os/vscode/settings.json ~/.config/Code/User/
    dos2unix ~/.config/Code/User/settings.json
    chmod 644 ~/.config/Code/User/settings.json
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
    mkdir -p ~/.config/azuredatastudio/User/

    # copy azuredatastudio keybindings config
    cp ./config/pop-os/azuredatastudio/keybindings.json ~/.config/azuredatastudio/User/
    dos2unix ~/.config/azuredatastudio/User/keybindings.json
    chmod 644 ~/.config/azuredatastudio/User/keybindings.json

    # copy azuredatastudio settings config
    cp ./config/pop-os/azuredatastudio/settings.json ~/.config/azuredatastudio/User/
    dos2unix ~/.config/azuredatastudio/User/settings.json
    chmod 644 ~/.config/azuredatastudio/User/settings.json
}

echo "dotfiles installed"

exit
