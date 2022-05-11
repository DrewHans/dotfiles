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

# copy bash config files
cp -u ./config/bash/.bash_aliases ~/
dos2unix ~/.bash_aliases
chmod 664 ~/.bash_aliases

dos2unix ./config/bash/append_to_bashrc.txt
cat ./config/bash/append_to_bashrc.txt >> ~/.bashrc

# copy git config files
cp -u ./config/git/.gitconfig ~/
dos2unix ~/.gitconfig
chmod 664 ~/.gitconfig

# copy totem thumbnailer file
#sudo mkdir -p /usr/share/thumbnailers/
#sudo mv /usr/share/thumbnailers/totem.thumbnailer /usr/share/thumbnailers/totem.thumbnailer.backup
#sudo cp -u ./config/thumbnailer/totem.thumbnailer /usr/share/thumbnailers/
#sudo dos2unix /usr/share/thumbnailers/totem.thumbnailer
#sudo chmod 644 /usr/share/thumbnailers/totem.thumbnailer

# copy mpv input config file to it's flatpak config directory
mkdir -p ~/.var/app/io.mpv.Mpv/config/mpv
cp -u ./config/mpv/input.conf ~/.var/app/io.mpv.Mpv/config/mpv/
dos2unix ~/.var/app/io.mpv.Mpv/config/mpv/input.conf
chmod 664 ~/.var/app/io.mpv.Mpv/config/mpv/input.conf

# make nvim directory if it doesn't exist
mkdir -p ~/.config/nvim

# copy nvim config files
cp -ur ./config/nvim/general ~/.config/nvim/
cp -u ./config/nvim/init.vim ~/.config/nvim/
find ~/.config/nvim -type f -print0 | xargs -0 dos2unix --
find ~/.config/nvim -type f -print0 | xargs -0 chmod 664 --

# copy easyeffects profile config file to it's flatpak config directory
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output
cp -u ./config/easyeffects/nyancat_easyeffects.json ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/
dos2unix ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json
chmod 664 ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json

# copy qbittorrent config files
mkdir -p ~/nyancat/.config/qBittorrent/
cp -u ./config/qbittorrent/qBittorrent.conf ~/nyancat/.config/qBittorrent/
dos2unix ~/nyancat/.config/qBittorrent/qBittorrent.conf
chmod 664 ~/nyancat/.config/qBittorrent/qBittorrent.conf

cp -u ./config/qbittorrent/darkstylesheet.qbtheme ~/nyancat/.config/qBittorrent/
# note: binary file darkstylesheet.qbtheme does not need dos2unix conversion
chmod 664 ~/nyancat/.config/qBittorrent/darkstylesheet.qbtheme

unzip ./config/qbittorrent/ipfilter_v0153.zip -d ./config/qbittorrent/
cp -u ./config/qbittorrent/ipfilter.dat ~/nyancat/.config/qBittorrent/
dos2unix ~/nyancat/.config/qBittorrent/ipfilter.dat
chmod 664 ~/nyancat/.config/qBittorrent/ipfilter.dat

# copy vim config files
cp -u ./config/vim/.vimrc ~/
dos2unix ~/.vimrc
chmod 664 ~/.vimrc

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
    mkdir -p ~/.config/Code/User/

    # copy vscode keybindings config
    cp ./config/vscode/keybindings.json ~/.config/Code/User/
    dos2unix ~/.config/Code/User/keybindings.json
    chmod 664 ~/.config/Code/User/keybindings.json

    # copy vscode settings config
    cp ./config/vscode/settings.json ~/.config/Code/User/
    dos2unix ~/.config/Code/User/settings.json
    chmod 664 ~/.config/Code/User/settings.json
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
    mkdir -p ~/.config/azuredatastudio/User/

    # copy azuredatastudio keybindings config
    cp ./config/azuredatastudio/keybindings.json ~/.config/azuredatastudio/User/
    dos2unix ~/.config/azuredatastudio/User/keybindings.json
    chmod 664 ~/.config/azuredatastudio/User/keybindings.json

    # copy azuredatastudio settings config
    cp ./config/azuredatastudio/settings.json ~/.config/azuredatastudio/User/
    dos2unix ~/.config/azuredatastudio/User/settings.json
    chmod 664 ~/.config/azuredatastudio/User/settings.json
}

echo "dotfiles installed"

exit
