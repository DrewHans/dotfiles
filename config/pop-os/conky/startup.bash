#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

# Launch Conky
conky -c ~/.config/conky/conky_desktop.conf --daemonize
conky -c ~/.config/conky/conky_desktop_image.conf --daemonize

exit 0
