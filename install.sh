#!/bin/bash

# Define function to handle creating links
function makeLink {
    SOURCE=$1
    FILENAME=$(basename $SOURCE)
    TARGET="$2/$FILENAME"

    if [ -L $TARGET ]
        then
            echo "=== WARNING: Link exists - $TARGET"
            echo "Removing it"
            rm -v $TARGET
    elif [ -f $TARGET ]
        then
            echo "=== WARNING: File exists - $TARGET"
            echo "Ignoring it"
    fi

    if [ ! -f $TARGET ]
        echo "Create Link:"
        ln -sv $SOURCE $TARGET
    fi
}

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Symlinks for files that reside in the home directory
find $DOTFILES_DIR/files -maxdepth 1 -type f | while read file; do makeLink $file $HOME; done;

# Git Symlinks
find $DOTFILES_DIR/files/git -maxdepth 1 -type f | while read file; do makeLink $file $HOME; done;

# Symlinks for the other dofiles
if [ ! -d "$HOME/.dotfiles" ]; then
  mkdir -v "$HOME/.dotfiles"
fi

if [ -f  $HOME/.dotfiles/.local ]; then
    touch $HOME/.dotfiles/.local
    echo "# This is a file for any settings unique to this machine" > $HOME/.dotfiles/.local
fi

# Move the rest of the files into ~/.dotfiles, which are then sourced by .bashrc
find $DOTFILES_DIR/files/others -maxdepth 1 -type f | while read file; do makeLink $file $HOME/.dotfiles; done;
