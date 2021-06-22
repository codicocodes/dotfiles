ZSH_DISABLE_COMPFIX=true

# Path to oh-my-zsh
export ZSH="/Users/codico/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins+=(zsh-vi-mode)
ZVM_VI_EDITOR=nvim

# Source
source $ZSH/oh-my-zsh.sh


# Functions
background_set() {
    echo "Setting image: $1"
    image_path="$HOME/wallpapers/$1.png"
    kitty @ set-background-image $image_path
    echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
    clear
}

background_random() {
    echo "Setting random image"
    image_path=find ~/wallpapers -iname '*.png' -type f | shuf -n1
    echo "image path: $image_path"
    kitty @ set-background-image $image_path
}

# Aliases
alias src="source ~/.zshrc"
alias nv="nvim"
alias vi="nvim"
alias bgs="background_set"
alias bgr="background_random"
alias bgp="ls ~/wallpapers"

## Projects
alias speedtyper="cd ~/code/stream/speedtyper"
alias st-client="cd ~/code/stream/speedtyper/speedtyper-client"
alias st-server="cd ~/code/stream/speedtyper/speedtyper-server"
alias dots="cd ~/code/dotfiles"

## Git
alias gs="git status"
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"

# Setup
# Set tab name or window title automatically to the current directory or file #930
precmd () {print -Pn "\e]0;%~\a"}
# Source nvm
source ~/.nvm/nvm.sh
