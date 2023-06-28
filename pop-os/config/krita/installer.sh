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

echo "Installing Krita dotfiles"

# check krita appimage exists
if [ -f ~/AppImages/krita-5.1.5-x86_64.appimage ]
then
	echo "Hi"
	# copy app icon
	cp -u ./krita-logo.png ~/.local/share/icons/krita-logo.png
	chmod 644 ~/.local/share/icons/krita-logo.png

	# copy gnome application .desktop file
	cp -u ./krita.desktop ~/.local/share/applications/krita.desktop
	chmod 644 ~/.local/share/applications/krita.desktop

	# add as default application to local mimeapps.list
	echo "[Default Applications]" > ~/.local/share/applications/mimeapps.list
	echo "application/x-krita=krita.desktop;" >> ~/.local/share/applications/mimeapps.list
	echo "" >> ~/.local/share/applications/mimeapps.list
fi
