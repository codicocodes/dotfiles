if status is-interactive
    # commands to run in interactive sessions can go here
end

##### PATH #####
set -g -x PATH /usr/local/bin $HOME/go/bin /opt/homebrew/bin/ $PATH

##### BACKGROUND IMAGE #####
function anime-bg-set
    set anime (find $HOME/wallpapers -type f \
       | fzf --preview "kitty icat --place 60x60@65x6 --transfer-mode file {} ")
    feh --bg-scale $anime
end

function anime-bg-random
    feh --bg-scale (random choice $HOME/wallpapers/*)
end

##### ALIAS #####
alias nv="nvim"
alias src="source ~/.config/fish/config.fish"
alias bgs="anime-bg-set"
alias b="anime-bg-random"

##### KEYBINDINGS #####
fish_vi_key_bindings
set fish_greeting

##### SETUP SCRIPT #####
function fish-setup
    git config --global core.editor 'nvim'
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install jorgebucaran/nvm.fish
    fisher install jethrokuan/z
    nvm install lts
    nvm use lts
    npm install -g prettier \
      eslint typescript typescript-language-server \
      vscode-langservers-extracted vue-language-server
end

##### TOGGLE KEYBOARD LAYOUT #####
function keyb 
    if test (uname) = Linux
        set layout (setxkbmap -query | awk '/layout/ {print $2}')
        if test $layout = 'us'
            setxkbmap -layout 'se'
            echo keyboard set to se
        else
            setxkbmap -layout 'us'
            echo keyboard set to us
        end
    end
end

##### WELCOME MESSAGE #####
if type -q figlet
    figlet welcome\n codico | lolcat
end
