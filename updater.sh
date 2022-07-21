#!/usr/bin/env bash


# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

# update repo's bash aliases
cp -u ~/.bash_aliases ./config/pop-os/bash/

# update repo's bashrc
cp -u ~/.bashrc ./config/pop-os/bash/

# update repo's git config files
cp -u ~/.gitconfig ./config/pop-os/git/

# update repo's mpv input config file
cp -u ~/.var/app/io.mpv.Mpv/config/mpv/input.conf ./config/pop-os/mpv/
cp -u ~/.var/app/io.mpv.Mpv/config/mpv/mpv.conf ./config/pop-os/mpv/

# update repo's nvim config files
cp -ur ~/.config/nvim/general ./config/pop-os/nvim/
cp -u ~/.config/nvim/init.vim ./config/pop-os/nvim/

# update repo's easyeffects profile config file
cp -u ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json ./config/pop-os/easyeffects/

# update repo's qbittorrent config files
cp -u ~/nyancat/.config/qBittorrent/qBittorrent.conf ./config/pop-os/qbittorrent/

# update repo's vim config files
cp -u ~/.vimrc ./config/pop-os/vim/

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
    # update repo's vscode keybindings config
    cp ~/.config/Code/User/keybindings.json ./config/pop-os/vscode/

    # update repo's vscode settings config
    cp ~/.config/Code/User/settings.json ./config/pop-os/vscode/
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
    # update repo's azuredatastudio keybindings config
    cp ~/.config/azuredatastudio/User/keybindings.json ./config/pop-os/azuredatastudio/

    # update repo's azuredatastudio settings config
    cp ~/.config/azuredatastudio/User/settings.json ./config/pop-os/azuredatastudio/
}

echo "dotfiles repo updated"

exit
