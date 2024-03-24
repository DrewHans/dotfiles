# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Add color to man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Add a new line at the end of the command prompt, improves prompt readability when several directories deep
PS1=${PS1%?}
PS1=${PS1%?}\n'$ '

# Add PhantomJS environment variable & location to PATH
if [ -d /home/nyancat/.local/share/phantomjs-2.1.1-linux-x86_64 ]; then
    # OPENSSL_CONF is required to fix 'Auto configuration failed' error
    export OPENSSL_CONF=/etc/ssl

    export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
    export PATH=${PATH}:/home/nyancat/.local/share/$PHANTOM_JS/bin
fi

# Add Java environment variable
if [ -d /usr/lib/jvm/java-17-openjdk-amd64 ]; then
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH=${PATH}:$JAVA_HOME/bin
fi

# Add local bin to path
if [ -d /home/nyancat/.local/bin ]; then
    export PATH=${PATH}:/home/nyancat/.local/bin
fi

#### Android Related
# Add Android environment variables
if [ -d /home/nyancat/bin/android/sdk ]; then
    export ANDROID_SDK_ROOT=/home/nyancat/bin/android/sdk
    export ANDROID_HOME=/home/nyancat/bin/android/sdk
fi

# Add Android build-tools to path
if [ -d $ANDROID_HOME/build-tools ]; then
    export PATH=${PATH}:$ANDROID_HOME/build-tools
fi

# Add Android cmdline-tools to path
if [ -d $ANDROID_HOME/cmdline-tools/latest/bin ]; then
    export PATH=${PATH}:$ANDROID_HOME/cmdline-tools/latest/bin
fi

# Add Android emulator to path
if [ -d $ANDROID_HOME/emulator ]; then
    export PATH=${PATH}:$ANDROID_HOME/emulator
fi

# Add Android platform-tools to path
if [ -d $ANDROID_HOME/platform-tools ]; then
    export PATH=${PATH}:$ANDROID_HOME/platform-tools
fi

# Add Android tools to path
if [ -d $ANDROID_HOME/tools ]; then
    export PATH=${PATH}:$ANDROID_HOME/tools
fi

# Add gradle to path
if [ -d /opt/gradle/gradle-7.5.1/bin ]; then
    export PATH=${PATH}:/opt/gradle/gradle-7.5.1/bin
fi

# Add Rust cargo env
if [ -d /home/nyancat/.cargo/ ]; then
	. "/home/nyancat/.cargo/env"
fi
