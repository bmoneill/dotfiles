#!/bin/bash
# Installs and configures necessary packages

pkgs_sys=(
    "acpi"
    "acpid"
    "base"
    "dosfstools"
    "efibootmgr"
    "exfat-utils"
    "grub"
    "inetutils"
    "linux"
    "linux-firmware"
    "linux-lts"
    "net-tools"
    "networkmanager"
    "ntp"
    "openssh"
    "posix-user-portability"
    "posix-xsi"
    "ufw"
)

pkgs_dev=(
    "base-devel"
    "clang"
    "docker"
    "docker-compose"
    "git"
    "hexedit"
    "jq"
    "linux-headers"
    "linux-lts-headers"
    "posix-c-development"
    "posix-software-development"
    "python"
    "python-pip"
    "valgrind"
)

pkgs_gui=(
    "alacritty"
    "bluez"
    "bluez-utils"
    "dunst"
    "font-manager"
    "gnome-keyring"
    "gnu-free-fonts"
    "htop"
    "maim"
    "mpv"
    "playerctl"
    "pulseaudio"
    "pulseaudio-alsa"
    "pulseaudio-bluetooth"
    "pulsemixer"
    "sxiv"
    "wireshark"
    "xautolock"
    "xclip"
    "xorg-server"
    "xorg-xauth"
    "xorg-xbacklight"
    "xorg-xdpyinfo"
    "xorg-xinit"
    "xorg-xinput"
    "xorg-xkbutils"
    "xorg-xkill"
    "xorg-xrdb"
    "xorg-xset"
    "xorg-xsetroot"
    "xss-lock"
    "xwallpaper"
    "zathura"
    "zathura-pdf-mupdf"
    "zathura-ps"
)

pkgs_util=(
    "aspell"
    "aspell-en"
    "bash-completion"
    "fzf"
    "gnu-netcat"
    "lynx"
    "man-db"
    "man-pages"
    "neovim"
    "nfs-utils"
    "nmap"
    "openvpn"
    "pass"
    "plan9port"
    "socat"
    "time"
    "tlp"
    "tmux"
    "wget"
    "whois"
)

# install packages ($@)
install_packages() {
    pacman -Syu --noconfirm $@
}

# install dotfiles from $1
install_dotfiles() {
    if [ -d "$1" ]; then
        echo "Installing dotfiles from $1..."
        cp -rv "$1/.*" "$HOME/"
    else
        echo "Dotfiles directory not found: $1"
    fi
}

enable_services() {
    for service in "$@"; do
        systemctl enable --now "$service"
        systemctl start "$service"
    done
}

install_packages "${pkgs_sys[@]}"
install_packages "${pkgs_dev[@]}"
install_packages "${pkgs_gui[@]}"
install_packages "${pkgs_util[@]}"
enable_services \
    "acpid" \
    "docker" \
    "ntpd" \
    "NetworkManager" \
    "tlp" \
    "ufw"
install_dotfiles .
