#!/usr/bin/bash
# |------------------------------------------|
# |       put dot files in right places      |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |                April 2018                |
# |            github: tarkin88              |
# |------------------------------------------|

echo -e "First checking:\n"
declare -a coreFiles=("./variables.sh" "./functions.sh")

for i in ${coreFiles[@]};
do
	if [ -f $i ]; then
		source $i
		echo -e "${GREEN}[*] ${i} loaded\n"
	else
		echo -e "[x] No ${i} File found!"
		exit 0
	fi
done

welcome

info 

ask_dots

ask_packages

echo -e "\n${CYAN}DONE"

exit 0
