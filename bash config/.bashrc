# ... leave the first 90ish percent of .bashrc alone
# add the following includes at the bottom of ./bashrc

# include alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# include custom `.bashrc` code
if [ -f ~/.bashrc_custom ]; then
    . ~/.bashrc_custom
fi

# you may want to put `export PATH=` lines below here, when in doubt: Google It!
