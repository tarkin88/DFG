#!/bin/sh
# |------------------------------------------|
# |      Script for automate the symlinks    |
# |            to the apps configs           |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               January 2017               |
# |------------------------------------------|


echo "Create the whole container"
rm -R $HOME/.dotfiles

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

#dunst
echo "Dunst...something your Linux"
delete_all $configs/dunts
$symlink $dots/dunst $configs

# i3
echo "i3 to me!"
delete_all $configs/i3
$symlink $dots/i3 $configs

#i3 blocks
echo "and blocks too"
delete_all $configs/i3blocks
$symlink $dots/i3blocks $configs

#RANGER
echo "A ranger in your Linux? what's about a rogue?"
delete_all $configs/ranger
$symlink $dots/ranger $configs

#XRESOURCES
delete_all $HOME/.Xresources
$symlink $dots/Xresources $HOME/.Xresources

#XINIT
delete_all $HOME/.xinitrc
$symlink $dots/xinitrc $HOME/.xinitrc

#xfce4 terminal
echo "Make better the terminal"
delete_all $configs/xfce4
$symlink $dots/xfce4 $configs

echo "maybe some theme too..."
xrdb $HOME/.Xresources

delete_all $HOME/.themes
$symlink $dots/themes $HOME/.themes

chmod +x $configs/bash_scripts/*
chmod +x $configs/i3blocks/*
echo ""
echo "DONE"
dunst  "That's all folks!!!"
