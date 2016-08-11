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