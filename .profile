#!/bin/sh

# add ~/.local/bin to $PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"

export SUDO_ASKPASS="/usr/local/bin/dmenupass"

# default $PS1 (not for bash)
export PS1="$ "

# default programs
export BROWSER="tabbed -r 2 surf -e a"
export EDITOR="vim"
export EMAIL="neomutt"
export IMAGE="sxiv"
export READER="zathura"
export TERMINAL="st"

export MAKEFLAGS="-j3"

# less stuff
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;32m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;48;34m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;35m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# load bashrc only if in bash
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

[ -f ~/.config/aliasrc ] && source "$HOME/.config/aliasrc"

# start X11 if not already started
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
