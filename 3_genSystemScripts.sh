#/usr/bin/sh

echo "Create a symlink for lock and screenshot  scripts"
echo " . "
sudo ln -s ~/.config/bash_scripts/lock.sh /usr/local/bin/lock
echo " . . "
sudo ln -s ~/.config/bash_scripts/screenshot.sh /usr/local/bin/screenshoot
echo "Done"
