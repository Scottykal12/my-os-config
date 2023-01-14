#!/bin/bash

# wget -O - https://raw.githubusercontent.com/scottykal12/my-os-config/main/makemine.sh | sh
# wget -O - https://raw.githubusercontent.com/scottykal12/my-os-config/main/makemine.sh >> test.sh && chmod 755 test.sh && ./test.sh

# update
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install git -y

git config --global user.name Scott Kalinec
git config --global user.email scottykal12@gmail.com

mkdir Projects

cd Projects

curl "https://api.github.com/users/Scottykal12/repos?page=1&per_page=100" |
  grep -e 'clone_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone

cd my-os-config

# vscode and extentions
sudo apt install code -y
sudo snap install code --classic
extentionsFILE="VSextentions"
extentions=$(cat $extentionsFILE)
for e in $extentions; do
    code --install-extension $e
done

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# libraries
libsFILE="FLTKlibs"
libs=$(cat $libsFILE)
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

# git name and email
git config --global user.name "Scott Kalinec"
git config --global user.email scottykal12@gmail.com
