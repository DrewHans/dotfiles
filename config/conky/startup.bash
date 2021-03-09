#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

# Launch Conky
conky -c ~/.config/conky/conky.conf --daemonize
conky -c ~/.config/conky/conky_images.conf --daemonize

exit 0
