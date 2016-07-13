# Load the shell dotfiles
for DOTFILE in `find $HOME/.dotfiles`;
do
    [ -f "$DOTFILE" ] && source "$DOTFILE";
done;

# Set Bash Prompt
PS1="[\A \u:\W] \$ "

# Bash History
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
