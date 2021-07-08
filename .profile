#!/bin/sh

export PS1="$USER@$(cat /etc/hostname) \${PWD/#$HOME/'~'} $ "

# add ~/.local/bin to $PATH
export PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):/opt/cross/bin:$PATH"


# XDG stuff
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss
export GOPATH="$XDG_DATA_HOME"/go

# default programs
export BROWSER="chromium"
export EDITOR="nvim"
export EMAIL="neomutt"
export IMAGE="sxiv"
export READER="zathura"
export TERMINAL="st"

export MAKEFLAGS="-j12"

# less stuff
export LESS=-R
export LESSHISTFILE="-"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;32m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;48;34m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;35m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[ -f $XDG_CONFIG_HOME/aliasrc ] && . "$XDG_CONFIG_HOME/aliasrc"

# start X11 if in tty1 and not already started
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx $HOME/.config/xinitrc
