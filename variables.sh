packagesList=./packages/packages.txt
aurPackagesList=./packages/aur_packages.txt

# *NOTE: changes on paths may required change on some scripts
configPath=$HOME/.config
binPath=$HOME/.bin

# Colors
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

# LOG FILE
LOG="${HOME}/`basename ${0}`.log" 

# HW
IW=$(ip -o link show | awk '{print $2,$9}' | grep 'UP' | awk '{print $1}' | rev | cut -c 2- | rev)