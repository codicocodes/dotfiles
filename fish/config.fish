functions -c fish_prompt _old_fish_prompt

function fish_prompt
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    _old_fish_prompt
end

function notify
    if test (uname) = Linux
        echo $argv[1] | lolcat
        notify-send $argv[1]
    else
        echo $argv[1]
    end
end

if status is-interactive
    set term_height (tput lines)
    # commands to run in interactive sessions can go here
end

##### PATH #####
set -g -x PATH /usr/local/bin $HOME/go/bin /opt/homebrew/bin/ $PATH

##### UPDATE BACKGROUND #####
function update-bg
    if test (uname) = Linux
        feh --bg-scale $argv[1]
    else
        echo "background_image $argv[1]" > "$HOME/code/dotfiles/kitty/background_image.conf"
        kitty @ set-background-image $argv[1]
    end
end

##### CALCULATE IMAGE SIZE #####
function get-preview-position
    set term_width (tput cols)
    set term_half_width (math ceil (math $term_width/2))
    set width $term_half_width
    set left $term_half_width
    set height (math ceil (math "$width / 1.6"))
    set top 0
    echo "$width"x"$height"@"$left"x"$top"
end

##### KITTY IMG PREVIEWER CMD #####
function previewer
    set position (get-preview-position)
    # img to preview as optional arg
    if not set -q argv[1]
        # return the cmd
        echo "kitty icat --place "$position" --transfer-mode file" 
    else
        # invoke the cmd
        cat $argv[1] | kitty icat --place "$position" --transfer-mode file 
    end
end

##### BACKGROUND IMAGE #####
function anime-bg-set
    # get the cmd
    set previewer_cmd (previewer)
    # select the img
    set anime (find $HOME/wallpapers -type f \
       | fzf --preview "$previewer_cmd {}" --preview-window noborder )
    update-bg $anime
    clear
    notify "new background image selected (ღ˘⌣˘ღ)"
end


##### RANDOM BACKGROUND #####
function anime-bg-random
    update-bg (random choice $HOME/wallpapers/*)
end

##### ALIAS #####
alias nv="nvim"
alias src="clear; source ~/.config/fish/config.fish"
alias p="anime-bg-set"
alias b="anime-bg-random"

##### SETTINGS #####
fish_vi_key_bindings
set fish_greeting

if type -q nvm
    nvm use lts > /dev/null
else
    echo 'nvm is not installed'
end

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
        set layout (xkb-switch)
        if test $layout = 'us'
            setxkbmap -layout 'se' 
            set msg keyboard set to se 
            echo $msg | lolcat
            notify-send "$msg"
        else
            setxkbmap -layout 'us'
            set msg keyboard set to us
            echo $msg | lolcat
            notify-send "$msg"
        end
    end
end

##### WELCOME MESSAGE #####
if type -q figlet
    figlet welcome\n codico | lolcat
end
