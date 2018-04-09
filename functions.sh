#!/usr/bin/bash
# |------------------------------------------|
# |         Author: Francisco Suárez         |
# |            github: tarkin88              |
# |                April 2018                |
# |  Some functions come from Helmuthdu Aui  |
# |            github: helmuthdu             |
# |------------------------------------------|

delete_all() {
	if  [[ -d "${1}" ]]; then
		rm -R ${1}
	fi
}

read_input() {
	#read -p "$prompt1" OPTION
	read -p "$1: " OPTION
    echo ""
    OPTION=`echo "$OPTION" | tr '[:upper:]' '[:lower:]'`
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

replace_line() { 
    local _search=${1}
    local _replace=${2}
    local _filepath=${3}
    local _filebase=`basename ${3}`

    sed -e "s/${_search}/${_replace}/" ${_filepath} > /tmp/${_filebase} 2>"$LOG"
    if [[ ${?} -eq 0 ]]; then
      mv /tmp/${_filebase} ${_filepath}
    else
      echo -e "failed: ${_search} - ${_filepath}"
    fi
} 

add_top() {
	sed -i "1 i\
	${1}" ${2}
}

infect_vim() {
	if  [ ! -d ~/.vim/autoload ]; then
		echo "eciste"
		mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
		echo -e "${GREEN}[*] Pathogen  (vim) Installed"
		git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
		echo -e "${GREEN}[*] Nerd Tree (vim) Installed"
	else
		echo -e "${GREEN}[*] Pathogen  (vim) already exist"
		echo -e "${GREEN}[*] Nerd Tree  (vim) already exist${WHITE}"
	fi
}

seek_and_destroy() {
	if  [ -d "${1}" ]; then
		delete_all ${1}
		echo -e "${BLUE}[-] ${1} Cleaned"
	fi
}

if_not_create() {
	if  [ ! -d "${1}" ]; then
		mkdir -p ${1}
		echo -e "${BLUE}[-] ${1} Created"
	fi	
}

copy_files() {
	declare -a FILES=$(ls ${1})
	for f in $FILES;
	do	
		if [[ ${3} -eq 1 ]]; then
			seek_and_destroy "${2}/.${f}"		
			cp -R "${1}/${f}" "${2}/.${f}"
		else
			seek_and_destroy "${2}/${f}"
			if_not_create ${2}
			cp -R "${1}/${f}" ${2}
		fi
		echo -e "${GREEN}[*] ${f} Copied"
	done
	echo -e "${WHITE}"
}

copy_dots() {	
	copy_files "dots/config" ${configPath} 0
	copy_files "dots/home" ${HOME} 1
	copy_files "bin" ${binPath} 0
	configure_devices
	ask_pathogen 
}

welcome() {
	echo -e "\n${WHITE} Welcome!"
	echo -e "\n${WHITE} This is a script generate many dots\n"
}

info(){
	echo -e "\n${BLUE}Here some info about your system:\n"
	echo -e "* ${BLUE}You have ${WHITE}$(sudo pacman -Q|wc -l) ${BLUE}Installed\n"
	echo -e "* ${BLUE}Running under ${WHITE}$(uname -r) ${BLUE} Kernel\n"
	echo -e "* ${BLUE}On ${WHITE}$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d '=' -f2 | cut -d '"' -f2)\n"

	pause_function
}

install_from_list() {
	sudo pacman -Sy `cat $packagesList` --noconfirm
}

install_from_aur() {
	yaourt -S `cat $aurPackagesList` --noconfirm
}

set_i3_color() {
	case "${1}" in
		0)
			replace_line "BACKGROUND" "set \$backgr ${2}" ${configPath}/i3/config				
			;;
		1)
			replace_line "FOREGROUND" "set \$foregr ${2}" ${configPath}/i3/config	
			;;	
		2)
			replace_line "ACCENT" "set \$accent ${2}" ${configPath}/i3/config	
			;;	
		3)
			replace_line "URGENT" "set \$urgent ${2}" ${configPath}/i3/config	
			;;	
	esac
}


i3_custom_theme() {
	# colors_schemas=('Nord' 'Radio')
	case "${1}" in
		"Nord")
			for index in "${!nord_schema[@]}"; do
			  set_i3_color $index ${nord_schema[$index]}
			done
			;;
		"Radio")
			for index in "${!nord_schema[@]}"; do
			  set_i3_color $index ${radio_schema[$index]}
			done
			;;	
	esac
	echo -e "${GREEN}[*] ${1} Applied\n ${WHITE}"

}

ask_pathogen() {
	read_input_text "Do you want use vim pathogen?"
	if [[ $OPTION == y ]]; then
		infect_vim
		add_top "map <C-l> :NERDTreeToggle<CR>" ~/.vimrc
		add_top "autocmd vimenter * NERDTree" ~/.vimrc
		add_top "execute pathogen#infect()" ~/.vimrc
	fi
	ask_themes
}
ask_dots() {
	read_input_text "Do you generate dots files?"
	if [[ $OPTION == y ]]; then
		copy_dots
	fi
}

ask_packages() {
	read_input_text "Do you want install extra packages on packages.txt?"
	if [[ $OPTION == y ]]; then
		info
		install_from_list
	fi

	read_input_text "Do you want install aur packages on aur_packages.txt?"
	if [[ $OPTION == y ]]; then
		install_from_aur
	fi
}

ask_themes(){
	read_input_text "Do you want custom theme?"
	if [[ $OPTION == y ]]; then
		for index in "${!colors_schemas[@]}"; do
	  		echo -e "${BLUE} ${index})${colors_schemas[$index]}${WHITE}\n"
		done
		read_input "Choose a theme option: "

		i3_custom_theme ${colors_schemas[$OPTION]}
	fi		
}

configure_devices() {
	echo -e "${BLUE}[-] Check Network interface"
	replace_line "interface = INTERFACE" "interface = ${IW}" ${configPath}/polybar/modules.conf		
	echo -e "${GREEN}[*] Network interface Applied\n ${WHITE}"

	echo -e "${BLUE}[-] Check Monitor Device"
	replace_line "monitor = MONITOR" "monitor = ${MONITOR}" ${configPath}/polybar/config		
	echo -e "${GREEN}[*] Monitor Device layout Applied\n ${WHITE}"

	if [ -d /sys/class/power_supply/BAT* ]; then
		BAT=$(ls /sys/class/power_supply/ | grep 'BAT')
		echo $BAT
		echo -e "${BLUE}[-] Check Battery device"
		replace_line "battery = BAT1" "battery = ${BAT}" ${configPath}/polybar/modules.conf		
		echo -e "${GREEN}[*] Battery configuration Applied\n ${WHITE}"
	fi
}