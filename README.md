# dotfiles
My .files for a Linux or macOS setup where BASH is being used

This inspiration for this repository came from here: [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)

Other sources include:
* [Keeping Persistent History in Bash](http://eli.thegreenplace.net/2013/06/11/keeping-persistent-history-in-bash)

## Installation
Perform the following steps:  
*  Clone the repository into a location that it can reside and where you will remember it, or fork your own copy and clone it:
  * `git clone --recursive https://github.com/seanlane/dotfiles.git`
*  `cd dotfiles`
*  `chmod u+x install.sh`
*  `./install.sh`

The changes will then be in place, and you can restart your terminal or enter the following command:  
`source ~/.bash_profile`

## Process

The install script will create a directory within your home directory called `.dotfiles` and then create symbolic links for the files that are in the `dotfiles/files` directories:

* `~/.gitconfig`            -> `dotfiles/files/git/.gitconfig`
* `~/.gitignore_global`     -> `dotfiles/files/git/.gitignore_global`
* `~/.bash_profile`         -> `dotfiles/files/runcom/.bash_profile`
* `~/.bashrc`               -> `dotfiles/files/runcom/.bashrc`
* `~/.inputrc`              -> `dotfiles/files/runcom/.inputrc`
* `~/.tmux.conf`            -> `dotfiles/files/runcom/.tmux.conf`
* `~/.dotfiles/.aliases`    -> `dotfiles/files/system/.aliases`
* `~/.dotfiles/.env`        -> `dotfiles/files/system/.env`
* `~/.dotfiles/.functions`  -> `dotfiles/files/system/.functions`
* `~/.dotfiles/.misc`       -> `dotfiles/files/system/.misc`
* `~/.vim/`                 -> `dotfiles/files/vim/.vim/`
* `~/.vimrc`                -> `dotfiles/files/vim/.vimrc`

When a login terminal connects (or a Terminal emulator in macOS), the terminal will source `.bash_profile`, which will source `.bashrc`, which then sources the files within `~/.dotfiles`. For non-login terminals, `.bashrc` is sourced and will then pull everything in as described.

By having everything linked, the git repository can be tracked without having to keep a repository in your home directory.

## Explanation of files that are created / installed

### `.dotfiles/files`

Files that will be symlinked to appropriate places in the home directory

### `dotfiles/files/git`

Configuration files for git, should be pretty self-explanatory

### `dotfiles/files/runcom`

This directory contains dotfiles for configurations that are run at the start of a command, or "run command" files.

#### `dotfiles/files/runcom/.bash_profile`

Source point, if you will, for the `dotfiles` when being loaded from a login terminal, or an emulated terminal on macOS.

#### `dotfiles/files/runcom/.bashrc` 

Source point for the `dotfiles` when being loaded from a non-login terminal.

#### `dotfiles/files/runcom/.inputrc`

Configuration settings for any program that uses `Readline`. [Source](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html)

#### `dotfiles/files/runcom/.tmux.conf`

Configuration settings for Tmux

### `dotfiles/files/system`

This directory has configuration settings that could be put into a `.profile`, `.bash_profile`, `.bashrc`, etc., but are broken up into separate files here and then sourced for organization

#### `dotfiles/files/system/.aliases`

Stores aliases that I have

#### `dotfiles/files/system/.env`

Contains settings relating to the environment.

#### `dotfiles/files/system/.functions`

Contains things that are just a little too small to have their own dedicated script.

#### `dotfiles/files/system/.misc`

Anything that doesn't fit in the previous three files.

#### `.local`

This file doesn't exist in the repository, but it will be created in the `~/.dotfiles` directory when running the `install.sh` script. This is a spot for anything that I want to set on a specific machine, but don't want to have in the repository.

### `dotfiles/files/vim`

Configuration settings for the `vim` editor.
