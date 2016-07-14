# dotfiles
My .files for a Linux or macOS setup where BASH is being used

This inspiration for this repository came from here: [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)

## Installation
Perform the following steps:  
*  Clone the repository into a location that it can reside and where you will remember it, or fork your own copy and clone it
*  `cd .dotfiles`
*  `chmod u+x install.sh`
*  `./install.sh`

The changes will then be in place, and you can restart your terminal or enter the following command:  
`source ~/.bash_profile`

## Process

The install script will create symbolic links for the files that are in the `dotfiles/files` and `dotfiles/files/git` directories:

* `.bash_profile`
* `.bashrc`
* `.inputrc`
* `.vimrc`
* `.gitconfig`
* `.gitignore_global`

It will then create a directory within your home directory called `.dotfiles` which will then contain symbolic links to the files located in the `dotfiles/files/others` directory. 

The first set of files need to reside in the home directory for everything to be properly sourced. When a login terminal connects (or a Terminal emulator in macOS), the terminal will source `.bash_profile`, which will source `.bashrc`, which then sources the files within `~/.dotfiles`. For non-login terminals, `.bashrc` is sourced and will then pull everything in as described.

By having everything linked, the git repository can be tracked without having to keep a repository in your home directory. I think my `.dotfile` are fairly small and lacking compared to some others I've seen, but I'm sure it will grow over time and the organization will allow it to do so smoothly.

## Explanation of files that are created / installed

### `.dotfiles/files`

Files that reside within the user's home directory, where they can be properly sourced

#### `.bash_profile`

Source point, if you will, for the `.dotfiles` when being loaded from a login terminal, or an emulated terminal on macOS.

#### `.bashrc` 

Source point for the `.dotfiles` when being loaded from a non-login terminal.

#### `.inputrc`

Configuration settings for any program that uses `Readline`. [Source](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html)

#### `.vimrc`

Configuration settings for the `vim` editor.

### `.dotfiles/files/git`

Configuration files for git, should be pretty self-explanatory

### `.dotfiles/files/others`

This directory has configuration settings that could be put into a `.profile`, `.bash_profile`, `.bashrc`, etc., but are broken up into separate files here and then sourced for organization

#### `.aliases`

Stores aliases that I have

#### `.env`

Contains settings relating to the environment. At the moment, seems to contain anything that doesn't fit somewhere else

#### `.functions`

Contains things that are just a little too small to have their own dedicated script.

#### `.local`

This file doesn't exist in the repository, but it will be created in the `~/.dotfiles` directory when running the `install.sh` script. This is a spot for anything that I want to set on a specific machine, but don't want to have in the repository.