#!/bin/bash

# Install xcode command-line tools
xcode-select --install

# Make sure we’re using the latest Homebrew
brew update
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# @TODO Install oh-my-zsh and plugins

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install neovim
brew install vim --with-override-system-vi
brew install ripgrep

# Install other useful binaries
brew install ffmpeg --with-libvpx
brew install fzf
# brew install grep
brew install git
brew install gnupg
brew install imagemagick --with-webp
brew install rename
brew install the_silver_searcher
brew install awscli
brew install gh
brew install openssl

# Remove outdated versions from the cellar
brew cleanup

# brew install nvm # This installs `npm` too using the recommended installation method
# nvm install 16
# nvm use 16

# npm install -g prettier
# npm install -g eslint
# npm install -g ngrok
# npm install -g typescript
# npm install -g typescript-language-server
# npm i -g vscode-langservers-extracted
# npm i -g vls
