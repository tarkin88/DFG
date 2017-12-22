#!/usr/bin/sh
# |------------------------------------------|
# |                Files generate            |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |               December 2017              |
# |------------------------------------------|

# This script needed for create the symlinks for th resources.

echo "Let's do this shit..."
mkdir -p  $HOME/.dotfiles
mkdir -p  $HOME/.themes

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
echo ""
#COMPTON
echo "."
delete_all $configs/compton
$symlink $dots/compton $configs
echo ". ."
#BASE
delete_all $configs/bash_scripts
$symlink $dots/bash_scripts $configs
echo ". . . "
#DUNST
delete_all $configs/dunst
$symlink $dots/dunst $configs
echo ". . . ."
#termite
delete_all $configs/termite
$symlink $dots/termite $configs
#ranger
delete_all $configs/ranger
$symlink $dots/ranger $configs
# i3
delete_all $configs/i3
$symlink $dots/i3 $configs
# polybar
delete_all $configs/polybar
$symlink $dots/polybar $configs
echo ". . . . . . ."
#VIM
delete_all $HOME/.vimrc
$symlink $dots/vimrc $HOME/.vimrc
echo ". . . . . . . ."
#XRESOURCES
delete_all $HOME/.Xresources
$symlink $dots/Xresources $HOME/.Xresources
echo ". . . . . . . . ."
#bashrc
delete_all $HOME/.bashrc
$symlink $dots/bashrc $HOME/.bashrc
echo ". . . . . . . . . ."
#mpd
delete_all $configs/.mpd
$symlink $dots/mpd $configs
echo ". . . . . . . . . . ."
#ncmpcpp
delete_all $HOME/.ncmpcpp
$symlink $dots/ncmpcpp $HOME/.ncmpcpp
#wall
delete_all $HOME/.wall.jpg 
$symlink $dots/wall.jpg $HOME/.wall.jpg

echo ". . . . . . . . . . . . "
#GTK
delete_all $configs/gtk-3.0/gtk.css
$symlink $dots/gtk.css $configs/gtk-3.0/
echo ". . . . . . . . . . . . . "
xrdb $HOME/.Xresources
chmod +x $configs/bash_scripts/*
echo ""
echo "MPD:"
mpc update | head -1
$HOME/.config/bash_scripts/launch_polybar.sh 
echo ""
echo "That's all folks!!!"

echo "relaunch Polybar (Press Enter after this)"