#!/bin/bash

# Update
sudo pacman -Syu --noconfirm

# set shell to fish
sudo chsh -s /usr/bin/fish

# AUR support via yay
sudo pacman -S --needed base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S waydroid

# memfd instead of ashmem_linux
