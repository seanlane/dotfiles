#!/bin/bash

# Define function to handle creating links
function makeLink {
    SOURCE=$1
    FILENAME=$(basename $SOURCE)
    TARGET="$2/$FILENAME"

    if [ -L $TARGET ]; then
            echo "=== WARNING: Link exists - $TARGET"
            echo "Removing it"
            rm -v $TARGET
    elif [ -f $TARGET ]
        then
            echo "=== WARNING: File exists - $TARGET"
            echo "Ignoring it"
    fi

    if [ ! -f $TARGET ]; then
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

if [ ! -f  $HOME/.dotfiles/.local ]; then
    touch $HOME/.dotfiles/.local
    echo "# This is a file for any settings unique to this machine" > $HOME/.dotfiles/.local 
fi

# Move the rest of the files into ~/.dotfiles, which are then sourced by .bashrc
find $DOTFILES_DIR/files/others -maxdepth 1 -type f | while read file; do makeLink $file $HOME/.dotfiles; done;

# OS Specific Installation steps

if [ $(uname) == "Darwin" ]; then
    chmod u+x files/scripts/mac_os_install.sh
    source files/scripts/mac_os_install.sh
    source files/scripts/mac_os_defaults.sh
fi

vim_wrapper() {
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    YELLOW="\033[0;33m"
    BLUE="\033[0;36m"
    NORMAL="\033[0m"

    VUNDLE_HTTPS="https://github.com/VundleVim/Vundle.vim.git"
    if [ ! -n "$VIM" ]; then
        VIM=~/.vim
    fi
    if [ -d "$VIM" ]; then
        printf "${YELLOW}%s${NORMAL}\n" "You already have $VIM directory."
        printf "${YELLOW}%s${NORMAL}\n" "You have to remove $VIM if you want to re-install."
        exit 0
    fi
# Prevent the cloned repository from having insecure permissions. Failing to do
# so causes compinit() calls to fail with "command not found: compdef" errors
# for users with insecure umasks (e.g., "002", allowing group writability). Note
# that this will be ignored under Cygwin by default, as Windows ACLs take
# precedence over umasks except for filesystems mounted with option "noacl".
    hash git >/dev/null 2>&1 || {
        printf "${RED}%s${NORMAL}\n" "Error: git is not installed."
        exit 1
    }
    if [ ! -d "$VIM/bundle/Vundle.vim" ]; then
        printf "${BLUE}%s${NORMAL}\n" "Installing Vundle..."
        env git clone --depth=1 $VUNDLE_HTTPS "$VIM/bundle/Vundle.vim"
    fi
    if [ ! -f $VIM/colors/wombat256mod.vim ]; then
        if [ ! -d $VIM/colors/ ]; then
            mkdir -p $VIM/colors
        fi
        wget 'http://www.vim.org/scripts/download_script.php?src_id=13400' -O $VIM/colors/wombat256mod.vim  
    fi
    printf "${GREEN}%s${NORMAL}\n" "Vimrc has been configured ;)"
    printf "${YELLOW}%s${NORMAL}\n" "Do not worry about error messages. When it occurs just press enter and wait till all plugins are installed."
    printf "${BLUE}%s${NORMAL}\n" "Keep calm and use VIM!"
}
vim_wrapper