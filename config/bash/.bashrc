# ... leave the first 90ish percent of .bashrc alone
# add the following includes at the bottom of ./bashrc

# include alias definitions
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi

# include custom `.bashrc` code
if [ -f ~/.bashrc_custom ]; then
    . ~/.bashrc_custom
fi
