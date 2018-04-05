#!/usr/bin/bash
# |------------------------------------------|
# |         Author: Francisco Suárez         |
# |       franksg88 [at] gmail [dot] com     |
# |                April 2018                |
# |            github: tarkin88              |
# |  Some functions come from Helmuthdu Aui  |
# |            github: helmuthdu             |
# |------------------------------------------|

delete_all() {
	if  [[ -d "${1}" ]]; then
		rm -R ${1}
	fi
}

read_input() {
	read -p "$prompt1" OPTION
}

read_input_text() { 
    read -p "$1 [y/N]: " OPTION
    echo ""
    OPTION=`echo "$OPTION" | tr '[:upper:]' '[:lower:]'`
} 

print_line() { 
    printf "${WHITE}%$(tput cols)s\n\n"| tr ' ' '-'
}

pause_function() { 
    print_line
    read -e -sn 1 -p "Press enter to continue..."
}

seek_and_destroy() {
	if  [ -d "${1}" ]; then
		delete_all ${1}
		echo -e "${BLUE}[-] ${1} Cleaned"
	fi
}

ask_dots() {
	read_input_text "Do you generate dots files?"
	if [[ $OPTION == y ]]; then
		copy_dots
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
	echo -e "${WHITE}"
}

welcome() {
	echo -e "\n${WHITE} Welcome!"
	echo -e "\n${WHITE} This is a script generator for ${WM} and dots"
}

info(){
	echo -e "\n${BLUE}Here some info about your system:\n"
	echo -e "* ${BLUE}You have ${WHITE}$(sudo pacman -Q|wc -l) ${BLUE}Installed\n"
	echo -e "* ${BLUE}Running under ${WHITE}$(uname -r) ${BLUE} Kernel\n"
	echo -e "* ${BLUE}On ${WHITE}$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d '=' -f2 | cut -d '"' -f2)\n"

	pause_function
}

ask_packages() {
	read_input_text "Do you want install extra packages on packages.txt?"
	if [[ $OPTION == y ]]; then
		install_from_list
	fi

	read_input_text "Do you want install aur packages on aur_packages.txt?"
	if [[ $OPTION == y ]]; then
		install_from_aur
	fi
}

install_from_list() {
	sudo pacman -Sy `cat $packagesList` --noconfirm
}

install_from_aur() {
	yaourt -S `cat $aurPackagesList` --noconfirm
}