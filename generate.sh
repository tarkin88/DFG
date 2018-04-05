#!/usr/bin/bash
# |------------------------------------------|
# |       put dot files in right places      |
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |                Mar  2018                 |
# |                 Tarkin88                 |
# |------------------------------------------|

echo -e "First checking:\n"
declare -a coreFiles=("./variables.sh" "./functions.sh")

for i in ${coreFiles[@]};
do
	if [ -f $i ]; then
		source $i
		echo -e "${GREEN}[*] ${i} loaded"
	else
		echo -e "[x] No ${i} File found!"
		exit 0
	fi
done

copy_dots

echo -e "\n${CYAN}DONE"
exit 0
