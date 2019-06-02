#!/usr/bin/env bash

# Wait for desktop environment to load
sleep 10

# Launch Conky
conky -c ~/.config/conky/conky.conf --daemonize

exit 0
