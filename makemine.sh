#!/bin/bash

# update
sudo apt update -y
sudo apt upgrade -y

# vscode and extentions
sudo apt install code -y
extentions='cat VSextentions'
for e in $extentions; do
    code --install-extension $e
done

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# libraries
libs='cat FLTKlibs'
for l in $libs; do
    sudo apt install $l -y
done

# python and pip
sudo apt install python3 && python3-pip

# procesing
# wget https://github.com/processing/processing4/releases/download/processing-1289-4.1.1/processing-4.1.1-linux-x64.tgz
# tar -xzf processing-4.*
# ~/processing

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# PRoject folder
mkdir ~/Projects

# git name and email
git config --global user.name "Scott Kalinec"
git config --global user.email scottykal12@gmail.com
