#!/bin/bash

# wget -O - https://raw.githubusercontent.com/scottykal12/my-os-config/main/makemine.sh | sh
# wget -O - https://raw.githubusercontent.com/scottykal12/my-os-config/main/makemine.sh >> test.sh && chmod 755 test.sh && ./test.sh

ogPWD=$(pwd)

debInstall() {
  # update
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install curl -y
  sudo apt install git -y
  sudo apt install htop -y
  sudo apt install fish -y
  sudo apt install btop -y

  # set shell to fish
  sudo chsh -s /usr/bin/fish

  # config git
  git config --global user.name Scott Kalinec
  git config --global user.email scottykal12@gmail.com

  mkdir Projects

  cd Projects

  # download all git repos
  curl "https://api.github.com/users/Scottykal12/repos?page=1&per_page=100" |
    grep -e 'clone_url*' |
    cut -d \" -f 4 |
    xargs -L1 git clone

  cd my-os-config

  # code
  sudo apt install cmake -y
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
  libsFILE="DEVlibs"
  libs=$(cat $libsFILE)
  for l in $libs; do
    sudo apt install $l -y
  done

  # python and pip
  sudo apt install python3 && python3-pip -y

  # chrome
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

  # Powershell
  sudo apt update  && sudo apt install -y curl gnupg apt-transport-https
  curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
  sudo apt update && sudo apt install -y powershell

  # cleanup
  rm -f google-chrome-stable_current_amd64.deb
  rm $ogPWD/makemine.sh
}

archInstall() {
  #  update
  sudo pacman -Sy -q --noconfirm
  sudo pacman -Su -q --noconfirm
  sudo pacman -S curl -q --noconfirm
  sudo pacman -S git -q --noconfirm
  sudo pacman -S btop -q --noconfirm
  sudo pacman -S fish -q --noconfirm
  
  # set shell to fish
  sudo chsh -s /usr/bin/fish

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
  sudo pacman -S htop -q --noconfirm
  sudo pacman -S cmake -q --noconfirm
  sudo pacman -S code -q --noconfirm
  extentionsFILE="VSextentions"
  extentions=$(cat $extentionsFILE)
  for e in $extentions; do
    code --install-extension $e
  done

  # rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  # libraries
  libsFILE="DEVlibs"
  libs=$(cat $libsFILE)
  for l in $libs; do
    sudo pacman -S $l -q --noconfirm
  done

  # python and pip
  sudo pacman -S python3 && python3-pip -q --noconfirm

  curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
  nvm install 18
  nvm use 18
  npm install -g gatsby-cli
  export NVM_DIR="$HOME/.nvm"

  # chrome
  pamac build google-chrome --no-confirm

  rm $ogPWD/makemine.sh
}

osType=$(cat /etc/os-release | grep -i "ID_LIKE")

if [[ "$osType" =~ "debian" ]]; then
  debInstall
fi

if [[ "$osType" =~ "arch" ]]; then
  archInstall
fi

cd ~

# # bash config
# bashconfig=$(cat bashrc)
# echo -e $bashconfig >> ~/.bashrc

# nvm Node.js and Gatsby
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
nvm install 18
nvm use 18
npm install -g gatsby-cli


# procesing
# wget https://github.com/processing/processing4/releases/download/processing-1289-4.1.1/processing-4.1.1-linux-x64.tgz
# tar -xzf processing-4.*
# ~/processing
