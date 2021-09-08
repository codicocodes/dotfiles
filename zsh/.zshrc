echo "  __     __     ______     __         ______     ______     __    __     ______    "
echo " /\ \  _ \ \   /\  ___\   /\ \       /\  ___\   /\  __ \   /\ '-./  \   /\  ___\   "
echo " \ \ \/ \/\ \  \ \  __\   \ \ \____  \ \ \____  \ \ \/\ \  \ \ \-./\ \  \ \  __\   "
echo "  \ \__/'\~\_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_\ \ \_\  \ \_____\ "
echo "   \/_/   \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_/  \/_/   \/_____/ "
                                                                                  

echo " ______     ______     _____     __     ______     ______    "
echo "/\  ___\   /\  __ \   /\  __-.  /\ \   /\  ___\   /\  __ \   "
echo "\ \ \____  \ \ \/\ \  \ \ \/\ \ \ \ \  \ \ \____  \ \ \/\ \  "
echo " \ \_____\  \ \_____\  \ \____-  \ \_\  \ \_____\  \ \_____\ "
echo "  \/_____/   \/_____/   \/____/   \/_/   \/_____/   \/_____/ "

ZSH_DISABLE_COMPFIX=true

# Path to oh-my-zsh
export ZSH="/Users/codico/.oh-my-zsh"
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
export PATH=$PATH:/usr/local/go/bin:$HOME/code/go/bin

# Functions
background_set() {
    echo "Setting image: $1"
    image_path="$HOME/wallpapers/$1.png"
    kitty @ set-background-image $image_path
    echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
    clear
}

bgr() {
    image_path=find ~/wallpapers -iname '*.png' -type f | shuf -n1
    kitty @ set-background-image $image_path
    echo "background_image $image_path" > "$HOME/code/dotfiles/kitty/background_image.conf"
}

brew_permissions() {
    sudo chown -R $(whoami) $(brew --prefix)/*
}

sumneko_build() {
    cd ~/code/lua-language-server/3rd/luamake
    ninja -f ninja/macos.ninja
    cd ../..
    ./3rd/luamake/luamake rebuild
}


# background_random() {
#     echo "Setting random image"
#     image_path=find ~/wallpapers -iname '*.png' -type f | shuf -n1
#     echo "image path: $image_path"
#     kitty @ set-background-image $image_path
# }

# Aliases
alias src="source ~/.zshrc"
alias vi="nvim"
alias nv="nvim"
alias bgs="background_set"
# alias bgr="background_random"
alias bgp="ls ~/wallpapers"

## Projects
alias speedtyper="cd ~/code/stream/speedtyper"
alias st-client="cd ~/code/stream/speedtyper/speedtyper-client"
alias st-server="cd ~/code/stream/speedtyper/speedtyper-server"
alias dots="cd ~/code/dotfiles"
alias ninja="~/code/ninja/ninja"

# ## Git
# alias gs="git status"
# alias gc="git commit -m"
# alias gco="git checkout"
# alias gcob="git checkout -b"

# Setup
# Set tab name or window title automatically to the current directory or file #930
precmd () {print -Pn "\e]0;%~\a"}
# Source nvm
export NVM_DIR=~/.nvm
source  ~/.nvm/nvm.sh
# source $(brew --prefix nvm)/nvm.sh
