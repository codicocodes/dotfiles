# Path to oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins+=(git zsh-autosuggestions zsh-z zsh-vi-mode)
ZVM_VI_EDITOR=nvim

# Source
source $ZSH/oh-my-zsh.sh

# Golang
# Append go binary to path and append gopls binary to path
# go should be installed at /user/local/go/bin
# gopls should be installed at ~/code/go/bin
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/code/delve/cmd/dlv:$HOME/code/go/bin/gofumpt:/opt/homebrew/bin/

# Functions
bgs2() {
    echo "Setting image: $1"
    image_path="$HOME/wallpapers/$1.png"
    kitty @ set-background-image $image_path
    echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
    clear
}

chmod +x $HOME/code/dotfiles/zsh/select_wallpaper.sh
background_set() {
    $HOME/code/dotfiles/zsh/select_wallpaper.sh
}

alias snapshot="git stash; git checkout stash@{0}; git checkout -; git stash pop;"

branch(){
    git checkout "$(git branch | fzf| tr -d '[:space:]')"
}

chmod +x $HOME/code/dotfiles/zsh/random_wallpaper.sh
bgr() {
    $HOME/code/dotfiles/zsh/random_wallpaper.sh
    # image_path=find ~/wallpapers -iname '*.png' -type f | shuf -n1
    # kitty @ set-background-image $image_path
    # echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
}

brew_permissions() {
    if ! command -v brew &> /dev/null
    then
        echo "brew could NOT be found."
        return
    fi
    echo "brew could be found"
    sudo chown -R $(whoami) $(brew --prefix)/*
}

# background_random() {
#     echo "Setting random image"
#     image_path=find ~/wallpapers -iname '*.png' -type f | shuf -n1
#     echo "image path: $image_path"
#     kitty @ set-background-image $image_path
# }

# Aliases
alias src="source ~/.zshrc"
alias nv="nvim"
alias bgs="background_set"
# alias bgr="background_random"
alias bgp="ls ~/wallpapers"
alias s=kitty +kitten ssh

## Projects
alias speedtyper="cd ~/code/stream/speedtyper"
alias st-client="cd ~/code/stream/speedtyper/speedtyper-client"
alias st-server="cd ~/code/stream/speedtyper/speedtyper-server"
alias dots="cd ~/code/dotfiles"

# Setup
# Set tab name or window title automatically to the current directory or file #930 (kitty)
precmd () {print -Pn "\e]0;%~\a"}
# Source nvm
export NVM_DIR=~/.nvm
source  ~/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
