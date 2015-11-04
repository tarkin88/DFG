#!/bin/sh
# This script needed for create the symlinks for th resources.

echo "Create the whole container"
mkdir -p  $HOME/.odf

dots=$HOME/.odf
configs=$HOME/.config/

cp -R * $dots

delete_all() {
	if  [[ -d "${1}" ]]; then
		rm -R ${1}
	fi
}

# ln options
symlink="ln -s -f -n"

#COMPTON
echo "Comptonize your Linux"
delete_all $configs/compton
$symlink $dots/compton $configs

#dunst
echo "Dunst...something your Linux"
delete_all $configs/dunts
$symlink $dots/dunst $configs

#OPENBOX
echo "Openboxing your Linux"
delete_all $configs/openbox
$symlink $dots/openbox $configs

#RANGER
echo "A ranger inyour Linux? what's about a rogue?"
delete_all $configs/ranger
$symlink $dots/ranger $configs

#VIM
echo "Some configs for your Linux!!!"
delete_all $HOME/.vimrc
$symlink $dots/vimrc $HOME/.vimrc
#XRESOURCES
delete_all $HOME/.Xresources
$symlink $dots/Xresources $HOME/.Xresources
#bashrc
delete_all $HOME/.bashrc
$symlink $dots/bashrc $HOME/.bashrc

echo "DONE !!!" && notify-send "DONE !!!"
