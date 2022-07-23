#!/usr/bin/env bash


# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

echo "Installing dotfiles"

# TODO: make install.sh files and separate apart this ball of mud

# copy bash aliases
cp -u ./config/pop-os/bash/.bash_aliases ~/
chmod 644 ~/.bash_aliases

# backup original bashrc (in case anything goes wrong)
cp -u ~/.bashrc ~/.bashrc_backup

# copy bashrc
cp -u ./config/pop-os/bash/.bashrc ~/
chmod 644 ~/.bashrc

# copy git config files
cp -u ./config/pop-os/git/.gitconfig ~/
chmod 644 ~/.gitconfig

# copy totem thumbnailer file
#sudo mkdir -p /usr/share/thumbnailers/
#sudo mv /usr/share/thumbnailers/totem.thumbnailer /usr/share/thumbnailers/totem.thumbnailer.backup
#sudo cp -u ./config/pop-os/thumbnailer/totem.thumbnailer /usr/share/thumbnailers/
#sudo chmod 644 /usr/share/thumbnailers/totem.thumbnailer

# copy mpv input config file to it's flatpak config directory
mkdir -p ~/.var/app/io.mpv.Mpv/config/mpv
cp -u ./config/pop-os/mpv/input.conf ~/.var/app/io.mpv.Mpv/config/mpv/
cp -u ./config/pop-os/mpv/mpv.conf ~/.var/app/io.mpv.Mpv/config/mpv/
chmod 644 ~/.var/app/io.mpv.Mpv/config/mpv/input.conf
chmod 644 ~/.var/app/io.mpv.Mpv/config/mpv/mpv.conf

# make nvim directory if it doesn't exist
mkdir -p ~/.config/nvim

# copy nvim config files
cp -ur ./config/pop-os/nvim/general ~/.config/nvim/
cp -u ./config/pop-os/nvim/init.vim ~/.config/nvim/
find ~/.config/nvim -type f -print0 | xargs -0 chmod 644 --

# copy easyeffects profile config file to it's flatpak config directory
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output
cp -u ./config/pop-os/easyeffects/nyancat_easyeffects.json ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/
chmod 644 ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output/nyancat_easyeffects.json

# copy qbittorrent config files to it's flatpak config directory
mkdir -p ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
cp -u ./config/pop-os/qbittorrent/qBittorrent.conf ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
chmod 644 ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/qBittorrent.conf

unzip ./config/pop-os/qbittorrent/ipfilter_v0153.zip -d ./config/pop-os/qbittorrent/
cp -u ./config/pop-os/qbittorrent/ipfilter.dat ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
chmod 644 ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/ipfilter.dat

# copy vim config files
cp -u ./config/pop-os/vim/.vimrc ~/
chmod 644 ~/.vimrc

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
    mkdir -p ~/.config/Code/User/

    # copy vscode keybindings config
    cp ./config/pop-os/vscode/keybindings.json ~/.config/Code/User/
    chmod 644 ~/.config/Code/User/keybindings.json

    # copy vscode settings config
    cp ./config/pop-os/vscode/settings.json ~/.config/Code/User/
    chmod 644 ~/.config/Code/User/settings.json
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
    mkdir -p ~/.config/azuredatastudio/User/

    # copy azuredatastudio keybindings config
    cp ./config/pop-os/azuredatastudio/keybindings.json ~/.config/azuredatastudio/User/
    chmod 644 ~/.config/azuredatastudio/User/keybindings.json

    # copy azuredatastudio settings config
    cp ./config/pop-os/azuredatastudio/settings.json ~/.config/azuredatastudio/User/
    chmod 644 ~/.config/azuredatastudio/User/settings.json
}

# add new document creation options to right click context menu
touch ~/Templates/json.json
touch ~/Templates/markdown.md
touch ~/Templates/opendoc_graphic.odg
touch ~/Templates/opendoc_presentation.odp
touch ~/Templates/opendoc_spreadsheet.ods
touch ~/Templates/opendoc_text.odt
touch ~/Templates/script.sh
echo -e '#!'"/usr/bin/env bash\n\n\n# CODE GOES HERE\n" > ~/Templates/script.sh
touch ~/Templates/text.txt

echo "dotfiles installed"

exit
