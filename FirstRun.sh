#!/bin/sh
# This script needed for create the symlinks for th resources.

echo "Create the whole container"
mkdir -p  $HOME/.dotfiles

dots=$HOME/.dotfiles
configs=$HOME/.config/

cp -R * $dots

delete_all() {
	if  [[ -d "${1}" ]]; then
		rm -R ${1}
	fi
}

# ln options
symlink="ln -s -f -n"

#SCRIPTS
delete_all $configs/bash_scripts
$symlink $dots/bash_scripts $configs

#COMPTON
echo "Comptonize your Linux"
delete_all $configs/compton
$symlink $dots/compton $configs

#dunst
echo "Dunst...something your Linux"
delete_all $configs/dunts
$symlink $dots/dunst $configs

# i3
echo "i3 to me!"
delete_all $configs/i3
$symlink $dots/i3 $configs

delete_all $configs/i3blocks
$symlink $dots/i3blocks $configs

#RANGER
echo "A ranger in your Linux? what's about a rogue?"
delete_all $configs/ranger
$symlink $dots/ranger $configs

#VIM
echo "Some extra configs for your Linux!!!"
delete_all $HOME/.vimrc
$symlink $dots/vimrc $HOME/.vimrc

#XRESOURCES
delete_all $HOME/.Xresources
$symlink $dots/Xresources $HOME/.Xresources

#XINIT
delete_all $HOME/.xinitrc
$symlink $dots/xinitrc $HOME/.xinitrc

#mpd
delete_all $configs/mpd
$symlink $dots/mpd $configs

echo "maybe some theme too..."
xrdb $HOME/.Xresources
echo "MPD:"
mpc update | head -1
chmod +x $configs/bash_scripts/*
chmod +x $configs/i3blocks/*
echo ""
echo "DONE"
dunst  "That's all folks!!!"
