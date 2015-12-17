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

#COMPTON
echo "Comptonize your Linux"
delete_all $configs/compton
$symlink $dots/compton $configs

#dunst
echo "Dunst...something your Linux"
delete_all $configs/dunts
$symlink $dots/dunst $configs

#i3
echo "Let's try i3...again xD"
delete_all $configs/i3
$symlink $dots/i3 $configs

#i3 blocks
delete_all $HOME.i3blocks.conf
$symlink $dots/i3blocks.conf $HOME/.i3blocks.conf


#termite
echo "Some colors for terminal"
delete_all $configs/termite
$symlink $dots/termite $configs

#tint2
#echo "Tinting your Linux"
#delete_all $configs/tint2
#$symlink $dots/tint2 $configs

#OPENBOX
#echo "Openboxing your Linux"
#delete_all $configs/openbox
#$symlink $dots/openbox $configs
#obmenu-generator -s -p -R

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
#bashrc
delete_all $HOME/.bashrc
$symlink $dots/bashrc $HOME/.bashrc
#mpd
delete_all $HOME/.mpd
$symlink $dots/mpd $HOME/.mpd
#ncmpcpp
delete_all $HOME/.ncmpcpp
$symlink $dots/ncmpcpp $HOME/.ncmpcpp
#conky
#delete_all $HOME/.conkyrc
#$symlink $dots/conkyrc $HOME/.conkyrc
##openbox_theme
#delete_all $HOME/.themes
#$symlink $dots/themes $HOME/.themes

xrdb $HOME/.Xresources

echo "DONE !!!" && notify-send "DONE !!!"
