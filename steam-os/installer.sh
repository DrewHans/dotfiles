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

echo "TODO: write installer script"
