#!/usr/bin/env bash


function check_not_root {
	if [[ $EUID -eq 0 ]]
	then
		echo "This script should not be run as root."
		exit 1
	fi
}

# safety checks
check_not_root

echo "Installing dotfiles"

# TODO: make install.sh files and separate apart this ball of mud

# copy bash aliases
cp -u ./config/bash/.bash_aliases ~/
chmod 644 ~/.bash_aliases

# backup original bashrc (in case anything goes wrong)
cp -u ~/.bashrc ~/.bashrc_backup

# copy bashrc
cp -u ./config/bash/.bashrc ~/
chmod 644 ~/.bashrc

# install user fonts
unzip -u ./config/fonts/fonts.zip -d ~/ >/dev/null 2>&1

# copy git config files
cp -u ./config/git/.gitconfig ~/
chmod 644 ~/.gitconfig

# copy gtk-3.0 config files
cp -u ./config/gtk-3.0/gtk.css ~/.config/gtk-3.0/
chmod 644 ~/.config/gtk-3.0/gtk.css
cp -u ./config/gtk-3.0/bookmarks ~/.config/gtk-3.0/
chmod 644 ~/.config/gtk-3.0/bookmarks

# copy htop config file
mkdir -p ~/.config/htop
cp -u ./config/htop/htoprc ~/.config/htop/
chmod 644 ~/.config/htop/htoprc

# copy totem thumbnailer file
#sudo mkdir -p /usr/share/thumbnailers/
#sudo mv /usr/share/thumbnailers/totem.thumbnailer /usr/share/thumbnailers/totem.thumbnailer.backup
#sudo cp -u ./config/thumbnailer/totem.thumbnailer /usr/share/thumbnailers/
#sudo chmod 644 /usr/share/thumbnailers/totem.thumbnailer

# copy authenticator config file to it's flatpak config directory
mkdir -p ~/.var/app/com.belmoussaoui.Authenticator/config/glib-2.0/settings
cp -u ./config/authenticator/keyfile ~/.var/app/com.belmoussaoui.Authenticator/config/glib-2.0/settings/
chmod 600 ~/.var/app/com.belmoussaoui.Authenticator/config/glib-2.0/settings/keyfile

# copy mpv input config file to it's flatpak config directory
mkdir -p ~/.var/app/io.mpv.Mpv/config/mpv
cp -u ./config/mpv/input.conf ~/.var/app/io.mpv.Mpv/config/mpv/
cp -u ./config/mpv/mpv.conf ~/.var/app/io.mpv.Mpv/config/mpv/
chmod 644 ~/.var/app/io.mpv.Mpv/config/mpv/input.conf
chmod 644 ~/.var/app/io.mpv.Mpv/config/mpv/mpv.conf

# make nvim directory if it doesn't exist
mkdir -p ~/.var/app/io.neovim.nvim/config/nvim/

# copy nvim config files
cp -u ./config/nvim/init.vim ~/.var/app/io.neovim.nvim/config/nvim/
chmod 644 ~/.var/app/io.neovim.nvim/config/nvim/init.vim

# copy easyeffects profile config file to it's flatpak config directory
mkdir -p ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/output
chmod -R 644 ./config/easyeffects
cp -Ru ./config/easyeffects/. ~/.var/app/com.github.wwmm.easyeffects/config/easyeffects/

# copy obs config files to it's config directory
mkdir -p ~/.config/obs-studio
chmod -R 644 ~/.config/obs-studio/
cp -Ru ./config/obs/obs-studio/. ~/.config/obs-studio/

# copy qbittorrent config files to it's flatpak config directory
mkdir -p ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
cp -u ./config/qbittorrent/qBittorrent.conf ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
chmod 644 ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/qBittorrent.conf

# if ipfilter.dat does not exist, add it
if [ ! -f ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/ipfilter.dat ]
then
	unzip ./config/qbittorrent/ipfilter_v0153.zip -d ./config/qbittorrent/
	cp -u ./config/qbittorrent/ipfilter.dat ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/
	chmod 644 ~/.var/app/org.qbittorrent.qBittorrent/config/qBittorrent/ipfilter.dat
fi

# copy vim config files
cp -u ./config/vim/.vimrc ~/
chmod 644 ~/.vimrc

# check if vscode is installed
command -v code >/dev/null 2>&1 && {
	mkdir -p ~/.config/Code/User/

	# copy vscode keybindings config
	cp ./config/vscode/keybindings.json ~/.config/Code/User/
	chmod 644 ~/.config/Code/User/keybindings.json

	# copy vscode settings config
	cp ./config/vscode/settings.json ~/.config/Code/User/
	chmod 644 ~/.config/Code/User/settings.json
}

# check if azuredatastudio is installed
command -v azuredatastudio >/dev/null 2>&1 && {
	mkdir -p ~/.config/azuredatastudio/User/

	# copy azuredatastudio keybindings config
	cp ./config/azuredatastudio/keybindings.json ~/.config/azuredatastudio/User/
	chmod 644 ~/.config/azuredatastudio/User/keybindings.json

	# copy azuredatastudio settings config
	cp ./config/azuredatastudio/settings.json ~/.config/azuredatastudio/User/
	chmod 644 ~/.config/azuredatastudio/User/settings.json
}

# check if vscodium is installed
command -v codium >/dev/null 2>&1 && {
	mkdir -p ~/.config/VSCodium/User/

	# copy codium keybindings config
	cp ./config/vscodium/keybindings.json ~/.config/VSCodium/User/
	chmod 644 ~/.config/VSCodium/User/keybindings.json

	# copy codium settings config
	cp ./config/vscodium/settings.json ~/.config/VSCodium/User/
	chmod 644 ~/.config/VSCodium/User/settings.json
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
