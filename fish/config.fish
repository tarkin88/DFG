# Path to Oh My Fish install.
set -gx OMF_PATH /home/frank/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /home/frank/.config/omf
#set -Ux EDITOR nano
#set --export EDITOR "nano -f"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
# make Vim the default editor
set --export EDITOR "vim -f"

# make Vim usable with git
set --export GIT_EDITOR "vim -f"

# use Vim as default pager
set --export PAGER "vimpager"
