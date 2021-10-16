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

cp -u ./config/bash/.bash_custom ~/
dos2unix ~/.bash_custom
chmod 664 ~/.bash_custom

dos2unix ./config/bash/append_to_bashrc.txt
cat ./config/bash/append_to_bashrc.txt >> ~/.bashrc

# copy git config files
cp -u ./config/git/.gitconfig ~/
dos2unix ~/.gitconfig
chmod 664 ~/.gitconfig

# copy gnome-terminal config files
cp -u ./config/gnome-terminal/org.gnome.Terminal.desktop ~/.local/share/applications/
dos2unix ~/.local/share/applications/org.gnome.Terminal.desktop
chmod 664 ~/.local/share/applications/org.gnome.Terminal.desktop

# copy mpv input config file to it's flatpak config directory
mkdir -p ~/.var/app/io.mpv.Mpv/config/mpv
cp -u ./config/mpv/input.conf ~/.var/app/io.mpv.Mpv/config/mpv/
chmod 664 ~/.var/app/io.mpv.Mpv/config/mpv/input.conf

# make nvim directory if it doesn't exist
mkdir -p ~/.config/nvim

# copy nvim config files
cp -ur ./config/nvim/general ~/.config/nvim/
cp -u ./config/nvim/init.vim ~/.config/nvim/
find ~/.config/nvim -type f -print0 | xargs -0 dos2unix --
find ~/.config/nvim -type f -print0 | xargs -0 chmod 664 --

# copy vim config files
cp -u ./config/vim/.vimrc ~/
dos2unix ~/.vimrc
chmod 664 ~/.vimrc

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
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
