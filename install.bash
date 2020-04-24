#!/usr/bin/env bash

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

command -v dos2unix >/dev/null 2>&1 || { echo >&2 "dos2unix is not installed.  Aborting."; exit 1; }



cp -ru ./scripts ~/
rm ~/scripts/README.md
for f in ~/scripts/*.bash; do
	dos2unix $f
	chmod 744 $f
done


cp -ru ./config/autostart ~/.config/
dos2unix ~/.config/autostart/startup.bash.desktop
chmod 754 ~/.config/autostart/startup.bash.desktop



cp -ru ./config/conky ~/.config/
dos2unix ~/.config/conky/conky.conf
chmod 754 ~/.config/conky/conky.conf
chmod 444 ~/.config/conky/conky_bg.png
chmod 444 ~/.config/conky/ubuntu-logo.png



cp -u ./config/git/.gitconfig ~/
dos2unix ~/.gitconfig
chmod 754 ~/.gitconfig



cp -ru ./config/vim/.vim ~/
dos2unix ~/.vim/autoload/onedark.vim
chmod 754 ~/.vim/autoload/onedark.vim
dos2unix ~/.vim/colors/onedark.vim
chmod 754 ~/.vim/colors/onedark.vim

cp -u ./config/vim/.vimrc ~/
dos2unix ~/.vimrc
chmod 754 ~/.vimrc



cp ./config/vscode/keybindings.json ~/.config/Code/User/
dos2unix ~/.config/Code/User/keybindings.json
chmod 644 ~/.config/Code/User/keybindings.json

cp ./config/vscode/settings.json ~/.config/Code/User/
dos2unix ~/.config/Code/User/settings.json
chmod 644 ~/.config/Code/User/settings.json



echo "dotfile install complete"
echo "don't forget to manually modify bashrc"

exit
