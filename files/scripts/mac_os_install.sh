#! /bin/bash
echo "Running Mac OS Installation steps"

# Check if brew is install; if not, install it and Cask
if ! $(command -v brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap caskroom/cask
    brew install brew-cask
    brew tap caskroom/versions


    # Install stuff 
    brew install git hub wget exercism \
        node nvm rbenv python python3 sbt scala sqlite postgresql \
        dinghy docker docker-compose docker-machine git  wget

    brew cask install firefox font-hack gimp google-chrome intellij-idea-ce \
        iterm2-beta java pycharm-ce sublime-text3 teamviewer virtualbox vlc 
else
    echo "Brew installed, skipping program installation"
fi

mac_os_defaults.sh
