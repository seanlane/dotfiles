#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load the shell dotfiles
#for DOTFILE in `find $HOME/.dotfiles`;
#do
#	echo "Dotfile is $DOTFILE";
#    [ -f "$DOTFILE" ] && source "$DOTFILE" && echo "Sourcing dotfile: $DOTFILE";
#done;

[ -f $HOME/.dotfiles/.aliases ] && source $HOME/.dotfiles/.aliases;
[ -f $HOME/.dotfiles/.functions ] && source $HOME/.dotfiles/.functions;
[ -f $HOME/.dotfiles/.misc ] && source $HOME/.dotfiles/.misc;
[ -f $HOME/.dotfiles/.env ] && source $HOME/.dotfiles/.env;
[ -f $HOME/.dotfiles/.local ] && source $HOME/.dotfiles/.local;

# Add dotfiles/bin to path
[ -L $HOME/.dotfiles/bin ] && pathmunge $HOME/.dotfiles/bin after

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
