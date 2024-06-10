#!/bin/bash

# Run
# cp ~/.dotfiles/.install_linux_arch.sh ~/.install
# sudo chmod +x ~/.install.sh
# bash ~/install.sh

cd ~

# Updated repos
sudo pacman -Syyu

# Install git & stow then clone .dotfiles & stow files
sudo pacman -S git stow --noconfirm
git clone https://github.com/Donk3ys/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
stow -vSt ~ alacritty nvim zsh tmux i3
cd ~

# Install packages
sudo pacman -S zsh zsh-completions tmux neovim fzf fd ripgrep alacritty go npm pnpm docker docker-compose vlc --noconfirm
yay -S nvm android-studio postman-bin google-chrome nvim-packer-git dbeaver mongodb-compass --noconfirm

# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Install node version manager
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install --lts
nvm alias default node

# Add tmux packages
mkdir ~/.dotfiles/tmux/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/tmux/.config/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.dotfiles/tmux/.config/tmux/plugins/tmux-resurrect

# Install PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
cp ~/.dotfiles/zsh/.config/zsh/themes/powerlevel10k.zsh-theme ~/.powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
#wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/last-working-dir/last-working-dir.plugin.zsh ~/.config/zsh/plugins

# Copy .zprofile to .zshrc as .zprofile not getting called
cp .zprofile .zshrc
source .zprofile

# Install flutter
git clone https://github.com/flutter/flutter.git -b stable ~/flutter
flutter precache
flutter doctor --android-licenses
# Add flutter / Dart extensions to android studio
# Add flutter folder path to android studio and select/add command line tools from android sdk manager

#Install nerd-fonts
# download from website nerdfonts.com
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -P ~/Downloads
cd /usr/share/fonts/
sudo mkdir nerd-fonts
cd nerd-fonts
sudo cp ~/Downloads/Meslo.zip /usr/share/fonts/nerd-fonts
sudo unzip Meslo.zip
sudo rm Meslo.zip
fc-cache -vf
fc-match Meslo -a

# Logout and back in to load .zprofile
# chsh -l
chsh -s /bin/zsh
#homectl update --shell=/bin/zsh

echo "Installing Finished"

# # Install lsp servers for nvim lsp-config
# sudo npm install -g bash-language-server diagnostic-languageserver solidity-language-server typescript typescript-language-server

#Reboot Machine

# Run to start android studio for first time
# /opt/android-studio/bin/studio.sh

# 1. Install android sdk
# 2. open extra sdk options and install command line tools
# 3. run flutter doctor
# 4. run flutter doctor --android-licenses
#
# Setup keyboard lights for rog strix laptop
# VERSION=1.5
# curl -LOs https://github.com/wroberts/rogauracore/releases/download/$VERSION/rogauracore-$VERSION.tar.gz
# tar xf rogauracore-$VERSION.tar.gz
# cd rogauracore-$VERSION/
# ./configure
# make
# sudo make install
# rogauracore initialize_keyboard
# rogauracore red
# rogauracore brightness 1
# # add start bash script to /etc/profile.d/ folder
# 	# !/bin/bash
# echo '
# rogauracore red
# rogauracore brightness 1
# Set mouse sensitivity
# xinput set-prop “Logitech Gaming Mouse G502” "Coordinate Transformation Matrix" 0.3 0 0 0 0.3 0 0 0 1
# ' | sudo tee -a /etc/profile
# # install light for screen brightness
# sudo pacman -S light
# sudo usermod -a G video $USER
# # Must reboot to take effect
