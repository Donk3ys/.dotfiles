#!/bin/bash

# Run
# sudo chmod +x ~/.install.sh
# bash ~/install.sh

cd ~

# Updated repos
sudo apt update -y && sudo apt upgrade -y

# Install git & stow then clone .dotfiles & stow files
sudo apt install git stow -y
git clone https://github.com/Donk3ys/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
stow -vSt ~ alacritty nvim zsh tmux
cd ~

# Install packages brew packages
sudo apt install zsh tmux fzf curl nodejs npm fd-find neovim -y

# Install PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
cp ~/.dotfiles/zsh/.config/zsh/themes/powerlevel10k.zsh-theme ~/.powerlevel10k

# Copy .zprofile to .zshrc as .zprofile not getting called
cp .zprofile .zshrc
source .zprofile

# Logout and back in to load .zprofile
# chsh -l
chsh -s /bin/zsh
#homectl update --shell=/bin/zsh

# Install "Packer" plugin manager for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install lsp servers for nvim lsp-config
sudo npm install -g bash-language-server intelephense typescript typescript-language-server

# Install flutter
mkdir ~/development
git clone https://github.com/flutter/flutter.git -b stable ~/development/flutter
flutter precache
flutter doctor --android-licenses

# Get android studio setup for sdk
# Install JDK
#sudo apt install openjdk-8-jdk-headless openjdk-11-jdk-headless openjdk-16-jdk-headless -y
sudo apt install openjdk-16-jdk-headless -y

# Download & install Android Studio
sudo dpkg --add-architecture i386
sudo apt update -y
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y
wget "https://dl.google.com/dl/android/studio/ide-zips/2020.3.1.25/android-studio-2020.3.1.25-linux.tar.gz" -P ~/Downloads
sudo tar -xvzf ~/Downloads/android-studio-2020.3.1.25-linux.tar.gz -C /opt/
sudo chown -R donk3y /opt/android-studio/
## mkdir -p "$HOME"/.local/share/applications
## cat > "$HOME"/.local/share/applications/android-studio.desktop <<-EOF
## 	[Desktop Entry]
## 	Version=2020.3.1.25
## 	Type=Application
## 	Name=Android Studio
## 	Exec="/opt/android-studio/bin/studio.sh" %f
## 	Icon=/opt/android-studio/bin/studio.png
## 	Categories=Development;IDE;
## 	Terminal=false
## 	StartupNotify=true
## 	StartupWMClass=android-studio
## EOF

# Install nerd-fonts
# download from website nerdfonts.com
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -P ~/Downloads
cd /usr/share/fonts/
sudo mkdir nerd-fonts
cd nerd-fonts
sudo cp ~/Downloads/Meslo.zip /usr/share/fonts/nerd-fonts
sudo unzip Meslo.zip
sudo rm Meslo.zip
fc-cache -vf
#Reboot
fc-match Meslo -a

echo "Installing Finished"

# Run to start android studio for first time
# /opt/android-studio/bin/studio.sh

# 1. Install android sdk
# 2. open extra sdk options and install command line tools
# 3. run flutter doctor
# 4. run flutter doctor --android-licenses
