#!/usr/bin/sh
# This script needed for create the symlinks for th resources.

echo "Let's do this shit..."
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
echo ". . . . ."
#OPENBOX
delete_all $configs/openbox
$symlink $dots/openbox $configs
echo ". . . . . ."
#RANGER
delete_all $configs/ranger
$symlink $dots/ranger $configs
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
delete_all $HOME/.mpd
$symlink $dots/mpd $HOME/.mpd
echo ". . . . . . . . . . ."
#ncmpcpp
delete_all $HOME/.ncmpcpp
$symlink $dots/ncmpcpp $HOME/.ncmpcpp
echo ". . . . . . . . . . . . "
#GTK
delete_all $configs/gtk-3.0/gtk.css
$symlink $dots/gtk.css $configs/gtk-3.0/
echo ". . . . . . . . . . . . . "
#tint2
delete_all $configs/tint2
$symlink $dots/tint2 $configs

xrdb $HOME/.Xresources
chmod +x $configs/bash_scripts/*
echo ""
echo "Now Listen:"
mpc update | head -1
echo ""
echo "That's all folks!!!"
