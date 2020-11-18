#! /usr/bin/env bash

SLR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#SLR_DIR=$(python -c "import os.path; print os.path.relpath('./', os.path.expanduser('~'))")

# Symlink dotfiles.
files=".bashrc .gitconfig .profile .xbindkeysrc .xinitrc"
for file in $files; do
	unlink $HOME/$file 2> /dev/null
	rm $HOME/$file
	ln -sf $SLR_DIR/$file $HOME/$file
done

mkdir -p $HOME/.config

configfiles="redshift.conf"
for file in $configfiles; do
	unlink $HOME/.config/$file 2> /dev/null
	ln -sf $SLR_DIR/$file $HOME/.config/$file
done

if [ ! -f $HOME/.netrc ]; then
#	rm $HOME/.netrc
	cp $SLR_DIR/.netrc $HOME/.netrc
	chmod og-rw $HOME/.netrc
fi


source $HOME/.bashrc

#Make changes in .bashrc immediately available
#builtin exec bash ;
