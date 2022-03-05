#!/bin/bash
cd ~

# Run
# cp ~/.dotfiles/.install_linux_arch.sh ~/.install
# sudo chmod +x ~/.install.sh
# bash ~/install.sh

# Updated repos
sudo pacman -Syyu

# Setup keyboard lights for rog strix laptop
VERSION=1.5
curl -LOs https://github.com/wroberts/rogauracore/releases/download/$VERSION/rogauracore-$VERSION.tar.gz
tar xf rogauracore-$VERSION.tar.gz
cd rogauracore-$VERSION/
./configure
make
sudo make install
rogauracore initialize_keyboard
rogauracore red
rogauracore brightness 2
# add start bash script to /etc/profile.d/ folder
	# !/bin/bash
	# rogauracore red
	# rogauracore brightness 2
# install light for screen brightness
sudo pacman -S light
sudo usermod -a G video donk3y
# Must reboot to take effect

# Install git & stow then clone .dotfiles & stow files
sudo pacman -S git stow --noconfirm
# git clone https://github.com/Donk3ys/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
stow -vSt ~ alacritty nvim zsh tmux
cd ~

# Install packages
sudo pacman -S zsh zsh-completions tmux nvim nodejs npm fzf fd alacritty go --noconfirm

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

# Install vim-plug plugin mamager for vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install lsp servers for nvim lsp-config
sudo npm install -g bash-language-server intelephense typescript typescript-language-server gopls


# Install flutter
mkdir ~/development
git clone https://github.com/flutter/flutter.git -b stable ~/development/flutter
flutter precache
flutter doctor --android-licenses

# Get android studio setup for sdk
# Install JDK
sudo pacman -S jdk-openjdk --noconfirm

# Download & insatll Android Studio
# sudo dpkg --add-architecture i386
# sudo pacman -S libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 --noconfirm
wget "https://dl.google.com/dl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz" -P ~/Downloads
sudo tar -xvzf ~/Downloads/android-studio-2021.1.1.22-linux.tar.gz -C /opt/
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

echo "Installing Finished"

#Reboot Machine

# Run to start android studio for first time
# sudo /opt/android-studio/bin/studio.sh

# 1. Install sdk
# 2. open extra sdk options and install command line tools
# 3. run flutter doctor
# 4. run flutter doctor --android-licenses
