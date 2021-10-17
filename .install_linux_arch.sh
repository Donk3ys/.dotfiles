#!/bin/bash
cd ~

# Updated repos
sudo pacman -Syyu

#Install nerd-fonts
# download from website nerdfonts.com
cd /usr/share/fonts/
sudo mkdir nerd-fonts
cd nerd-fonts
sudo cp ~/Downloads/Meslo.zip /usr/share/fonts/nerd-fonts
sudo unzip Meslo.zip
fc-cache -vf
#Reboot
fc-match Meslo -a

# Install git & stow then clone .dotfiles & stow files
sudo pacman -S git stow
git clone https://github.com/Donk3ys/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
stow -vSt ~ alacritty nvim zsh
cd ~

# Install packages brew packages
sudo pacman -S zsh zsh-completions tmux nvim node fzf fd alacritty

# Logout and back in to load .zprofile
# chsh -l
chsh -s /bin/zsh
#homectl update --shell=/bin/zsh

# Install PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
cp ~/.dotfiles/zsh/.config/zsh/themes/powerlevel10k.zsh-theme ~/.powerlevel10k

# Copy .zprofile to .zshrc as .zprofile not getting called
cp .zprofile .zshrc
source .zprofile

# Install vim-plug plugin mamager for vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install lsp servers for nvim lsp-config
npm install -g bash-language-server intelephense typescript typescript-language-server

# install flutter
mkdir ~/development
git clone https://github.com/flutter/flutter.git -b stable ~/development/flutter
