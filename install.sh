#!/bin/bash

# Color constants
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"    

# Define function to handle creating links
function makeLink {
    SOURCE=$1
    FILENAME=$(basename $SOURCE)
    TARGET="$2/$FILENAME"

    if [ -L $TARGET ]; then
            yellow "=== WARNING: Link exists - $TARGET"
            yellow "Removing it" 
            rm -v $TARGET
    elif [ -f $TARGET ]
        then
            red "=== WARNING: File exists - $TARGET"
            yellow "Ignoring it"
    fi

    if [ ! -f $TARGET ]; then
        blue "Create Link: ln -sv $SOURCE $TARGET"
        ln -sv $SOURCE $TARGET
    fi
}

function blue {
    printf "${BLUE}%s${NORMAL}\n" "$1"
}

function green {
    printf "${GREEN}%s${NORMAL}\n" "$1"
}

function red {
    printf "${RED}%s${NORMAL}\n" "$1"
}

function yellow {
    printf "${YELLOW}%s${NORMAL}\n" "$1"
}

blue "Starting installation of dotfiles"
# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Update dotfiles and vim submodules first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" submodule update --recursive --remote

# Symlinks for files that reside in the home directory
find $DOTFILES_DIR/files/git -maxdepth 1 -type f | while read file; do makeLink $file $HOME; done;
find $DOTFILES_DIR/files/runcom -maxdepth 1 -type f | while read file; do makeLink $file $HOME; done;
find $DOTFILES_DIR/files/vim ! -path $DOTFILES_DIR/files/vim ! -name .DS_Store -maxdepth 1 | while read file; do makeLink $file $HOME; done;

# Symlinks for the other dofiles
if [ ! -d "$HOME/.dotfiles" ]; then
  mkdir -v "$HOME/.dotfiles"
fi

if [ ! -f  $HOME/.dotfiles/.local ]; then
    touch $HOME/.dotfiles/.local
    echo "# This is a file for any settings unique to this machine" > $HOME/.dotfiles/.local 
fi

find $DOTFILES_DIR/files/system -maxdepth 1 -type f | while read file; do makeLink $file $HOME/.dotfiles; done;

# OS Specific Installation steps

if [ $(uname) == "Darwin" ]; then
    blue "Detected macOS, running specific scripts"
    chmod u+x install_scripts/mac_os_install.sh
    source install_scripts/mac_os_install.sh
    source install_scripts/mac_os_defaults.sh
fi

green "Finished installation of dotfiles"