#!/usr/bin/env bash


# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

echo "Updating dotfiles repo"

# update repo's bash aliases
cp -u ~/.bash_aliases ./config/bash/

# update repo's bashrc
cp -u ~/.bashrc ./config/bash/

# update repo's git config files
cp -u ~/.gitconfig ./config/git/

# update gtk-3.0 config files
cp -u ~/.config/gtk-3.0/gtk.css ./config/gtk-3.0/
cp -u ~/.config/gtk-3.0/bookmarks ./config/gtk-3.0/

# update repo's htop config file
cp -u ~/.config/htop/htoprc ./config/htop/

# update repo's authenticator config file
cp -u ~/.var/app/com.belmoussaoui.Authenticator/config/glib-2.0/settings/keyfile ./config/authenticator/

# update repo's mpv input config file
cp -u ~/.var/app/io.mpv.Mpv/config/mpv/input.conf ./config/mpv/
cp -u ~/.var/app/io.mpv.Mpv/config/mpv/mpv.conf ./config/mpv/

# update repo's nvim config files
cp -u ~/.var/app/io.neovim.nvim/config/nvim/init.vim ./config/nvim/

# update repo's easyeffects profile config file
cp -Ru ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/input ./config/easyeffects/
cp -Ru ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output ./config/easyeffects/

# update repo's obs config files
cp -u ~/.var/app/com.obsproject.Studio/config/obs-studio/global.ini ./config/obs/obs-studio/
cp -Ru ~/.var/app/com.obsproject.Studio/config/obs-studio/basic ./config/obs/obs-studio/
rm ./config/obs/obs-studio/basic/scenes/*.bak

# update repo's qbittorrent config files
cp -u ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/qBittorrent.conf ./config/qbittorrent/

# update repo's vim config files
cp -u ~/.vimrc ./config/vim/

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
    # update repo's vscode keybindings config
    cp ~/.config/Code/User/keybindings.json ./config/vscode/

    # update repo's vscode settings config
    cp ~/.config/Code/User/settings.json ./config/vscode/
}

# check if vscodium is installed
command -v codium >/dev/null 2>&1 && {
    # update repo's vscodium keybindings config
    cp ~/.config/VSCodium/User/keybindings.json ./config/vscodium/

    # update repo's vscodium settings config
    cp ~/.config/VSCodium/User/settings.json ./config/vscodium/
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
    # update repo's azuredatastudio keybindings config
    cp ~/.config/azuredatastudio/User/keybindings.json ./config/azuredatastudio/

    # update repo's azuredatastudio settings config
    cp ~/.config/azuredatastudio/User/settings.json ./config/azuredatastudio/
}

echo "dotfiles repo updated"

exit
