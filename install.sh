#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Symlinks for rc files
ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.vimrc" ~

# Git Symlinks
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Symlinks for the other dofiles
if [ ! -d "$HOME/.dotfiles" ]; then
  mkdir "$HOME/.dotfiles"
fi

ln -sfv "$DOTFILES_DIR/system/.alias" "$HOME/.dotfiles/"
ln -sfv "$DOTFILES_DIR/system/.env" "$HOME/.dotfiles/"
ln -sfv "$DOTFILES_DIR/system/.func:wqtions" "$HOME/.dotfiles/"
