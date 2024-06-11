#!/bin/bash
cd ~

# Install x-code tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update && brew upgrade

# Install git & stow then clone .dotfiles & stow files
brew install git stow
git clone https://github.com/Donk3ys/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
stow -vSt ~ *
cd ~

# Install packages brew packages
brew install alacritty zsh tmux neovim node fzf fd

# Install PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
cp ~/.dotfiles/zsh/.config/zsh/themes/powerlevel10k.zsh-theme ~/.powerlevel10k

# Install vim-plug plugin mamager for vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install lsp servers for nvim lsp-config
npm install -g bash-language-server intelephense typescript typescript-language-server svelte-language-server

# install flutter
mkdir ~/development
git clone https://github.com/flutter/flutter.git -b stable ~/development/flutter
flutter precache

# maybe insatll
# brew install --cask stats
