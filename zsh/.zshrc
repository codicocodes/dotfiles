# Settings
ZSH_DISABLE_COMPFIX=true

# Path to oh-my-zsh
export ZSH="/Users/codico/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh


# Aliases
alias speedtyper="cd ~/code/stream/speedtyper"
alias st-client="cd ~/code/stream/speedtyper/speedtyper-client"
alias st-server="cd ~/code/stream/speedtyper/speedtyper-server"
alias dots="cd ~/code/dotfiles"

# Setup
# Set tab name or window title automatically to the current directory or file #930
precmd () {print -Pn "\e]0;%~\a"}
# Source nvm
source ~/.nvm/nvm.sh
