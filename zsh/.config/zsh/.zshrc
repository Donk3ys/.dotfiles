# Android sdk
#export ANDROID_HOME="$HOME/Library/Android/sdk" # MacOS
export ANDROID_HOME="$HOME/Android/Sdk" # linux
export PATH="$PATH/:$ANDROID_HOME/platform-tools"

# Chrome Linux
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# Dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Dotnet
export PATH="$PATH":"/home/donk3y/.dotnet/tools"

# Flutter /Users/donk3y/development/flutter/bin
export PATH="$HOME/development/flutter/bin:$PATH"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Java
#export JAVA_HOME=$(/usr/libexec/java_home)

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# ### points python to pyenv installed python version
# eval "$(pyenv init -)"

# Rust
# . "$HOME/.cargo/env"

ENABLE_CORRECTION="true"
ZSH_DISABLE_COMPFIX=true


# Helper plugin functions
source "$ZDOTDIR/zsh-functions"

# Theme
 source ~/.config/zsh/themes/gruvbox-material-dark.zsh-theme
 source ~/.powerlevel10k/powerlevel10k.zsh-theme


# Plugins
#source ~/.config/zsh/plugins/last-working-dir.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

# Add auto complete for git
autoload -Uz compinit && compinit


# Aliases
alias vim="~/Downloads/nvim.appimage"
export EDITOR='vim'
alias l="ls -l"
alias la="ls -a -l"
alias dkr="docker"
alias dc="docker-compose"
alias cwd="pwd"
alias studio="/opt/android-studio/bin/studio.sh" # ubuntu android studio
alias pub="flutter pub"
alias pubo="flutter pub outdated"
alias pubu="flutter pub upgrade"

alias zshrc="~/.dotfiles/zsh/.config/zsh/.zshrc"
alias vimi="~/.dotfiles/nvim/.config/nvim/"


#### Speeds up paste time
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# FZF
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh   # MacOS
source /usr/share/fzf/key-bindings.zsh  # Arch
source /usr/share/fzf/completion.zsh    # Arch

# Setting fd as the default source for fzf
# Respect .ignore file
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME --type f --hidden --follow --exclude .git"

# Start Tmux and restore last save session
#tmux a; xdotool key ctrl+a ctrl-r
