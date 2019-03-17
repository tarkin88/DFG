#!/usr/bin/bash
# |------------------------------------------|
# |       put dot files in right places      |
# |         Author: Francisco Suárez         |
# |            github: tarkin88                  |
# |                March  201 9                     |
# |                 Credits:               			      |
# |              - helmuthdu                        |
# |              - addy-dclxvi               		 |	
# |------------------------------------------|

echo -e "First checking:\n"
declare -a coreFiles=("./variables.sh" "./functions.sh" "./theme.sh")

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

ask_packages

ask_dots

reload_all

say_goodbye
