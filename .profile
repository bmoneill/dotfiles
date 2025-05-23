#!/bin/sh

# default programs
export BROWSER="google-chrome-stable"
export EDITOR="nvim"
export IMAGE="sxiv"
export READER="zathura"
export TERMINAL="st"

# XDG stuff
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GOPATH="$XDG_DATA_HOME"/go


# add ~/.local/bin, cross compilers, ruby gems to $PATH
export PATH="$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):/opt/cross/bin:/home/ben/.gem/ruby/3.0.0/bin:$PATH"

# GPT
. ~/.local/share/chatgpt.conf
export OPENAI_API_KEY

# GUI fixes
export GDK_SCALE=2
export QT_SCALE_FACTOR=2
export _JAVA_AWT_WM_NONREPARENTING=1


# GPG fix
GPG_TTY=$(tty)
export GPG_TTY

# default make args
export MAKEFLAGS="-j12"

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

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx $HOME/.config/xinitrc
