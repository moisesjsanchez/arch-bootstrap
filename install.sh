#!/usr/bin/env bash

echo -e 'Starting the bootstrap \n'

# Keygen 

# Dotfiles
cd ~
mkdir Configs
cd Configs
git@github.com:moisesjsanchez/gentoo_conf.git
cd ~
mkdir Pictures && mkdir wallpapers
cd Pictures/wallpapers
# wallpapers link

# Symlinks 

# AUR Helper setup
sudo pacman -S base-devel
cd  ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Packages
pacman=(
    xorg
    st
    bspwm
    unzip
    xclip
    ranger
    picom
    firefox
    chromium
    vim
    feh
    python
    go
    npm
    docker
    code
    python-pywal
    dhcpcd
    networkmanager
    neofetch
    htop
)

# AUR Specific Packages

yay=(
    google-chrome
    google-cloud-sdk
    polybar
    cherry-font-git
)

sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}

# TODO: Setup bins paths in xinitrc

systemctl enable NetworkManager
systemctl enable dhcpcd

echo 'Installation Complete!'