#!/usr/bin/bash

symlink="ln -s -f -n"

delete_all() {
	if  [[ -d "${1}" ]]; then
		rm -R ${1}
	fi
}

read_input_text() { 
    read -p "$1 [y/N]: " OPTION
    echo ""
    OPTION=`echo "$OPTION" | tr '[:upper:]' '[:lower:]'`
} 

seek_and_destroy() {
	if  [ -d "${1}" ]; then
		rm -R ${1}
		echo -e "${BLUE}[-] ${1} Cleaned"
	fi
}

copy_dots() {	
	declare -a FILES=$(ls "dots")

	for f in $FILES;
	do	
		seek_and_destroy "${configPath}/${f}"
		cp -R "dots/${f}" ${configPath}
		echo -e "${GREEN}[*] ${f} Copied"
	done
}