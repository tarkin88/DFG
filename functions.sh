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
	if  [[ -d "${1}" ]]; then
		delete_all ${1}
		echo -e "${YELLOW}[-] ${1} Cleaned"
	elif [[ -f "${1}"  ]]; then
		delete_all ${1}
		echo -e "${YELLOW}[-] ${1} Cleaned"
	fi
}

set_permissions() {
	declare -a FILES=$(ls ${1})
	for f in $FILES;
	do	
		chmod +x ${1}/${f}
		echo -e "${GREEN}[*] ${f} Permission Applied"
	done
	echo -e "${WHITE}"
}

if_not_create() {
	if  [ ! -d "${1}" ]; then
		mkdir -p ${1}
		echo -e "${YELLOW}[-] ${1} Created"
	fi	
}
xrdb_reload() {
	xrdb ${HOME}/.Xresources
	echo -e "${GREEN}[*] X resources reloaded\n ${WHITE}"
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
	set_permissions ${binPath}
	configure_devices
}

welcome() {
	echo -e "\n${WHITE} Welcome!"
	echo -e "\n${WHITE} This is a script generate many dots\n"
}

info(){
	echo -e "\n${YELLOW}Here some info about your system:\n"
	echo -e "* ${YELLOW}You have ${WHITE}$(sudo pacman -Q|wc -l) ${YELLOW}Installed\n"
	echo -e "* ${YELLOW}Running under ${WHITE}$(uname -r) ${YELLOW} Kernel\n"
	echo -e "* ${YELLOW}On ${WHITE}$(cat /etc/os-release | grep 'PRETTY_NAME' | cut -d '=' -f2 | cut -d '"' -f2)\n"

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
	# colors_schemas=('NavyNIvory' 'Radio')
	case "${1}" in
		"NavyNIvory" )
			for index in "${!navy_n_ivory[@]}"; do
			  set_i3_color $index ${navy_n_ivory[$index]}
			done
			;;
		"Radio")
			for index in "${!radio_schema[@]}"; do
			  set_i3_color $index ${radio_schema[$index]}
			done
			;;	
	esac
	echo -e "${GREEN}[*] ${1} Applied\n ${WHITE}"

}

apply_antigen() {
	if  [ ! -f "${HOME}/antigen.zsh" ]; then
		curl -L git.io/antigen > antigen.zsh
	fi	
	copy_files "dots/antigen" ${HOME} 1
	echo -e "${GREEN}[*] Antigen applied ${WHITE}\n"
}

ask_pathogen() {
	read_input_text "Do you want use vim pathogen?"
	if [[ $OPTION == y ]]; then
		infect_vim
		add_top "map <C-l> :NERDTreeToggle<CR>" ~/.vimrc
		add_top "autocmd vimenter * NERDTree" ~/.vimrc
		add_top "execute pathogen#infect()" ~/.vimrc
		echo -e "\n"
	else 
		echo -e "${YELLOW}[-] Passed${WHITE}\n"
	fi

}
ask_dots() {
	read_input_text "Do you generate dots files?"
	if [[ $OPTION == y ]]; then
		copy_dots
		ask_themes
		ask_zsh
		ask_pathogen
		xrdb_reload
	else 
		echo -e "${YELLOW}[-] Passed${WHITE}\n"
	fi
}

ask_packages() {
	read_input_text "Do you want install extra packages on packages.txt?"
	if [[ $OPTION == y ]]; then
		info
		install_from_list
	else 
		echo -e "${YELLOW}[-] Passed${WHITE}\n"
	fi

	read_input_text "Do you want install aur packages on aur_packages.txt?"
	if [[ $OPTION == y ]]; then
		install_from_aur
	else 
		echo -e "${YELLOW}[-] Passed${WHITE}\n"
	fi
}

ask_themes(){
	for index in "${!colors_schemas[@]}"; do
  		echo -e "\n${YELLOW} ${index})${colors_schemas[$index]}${WHITE}\n"
	done
	read_input "Choose a theme option (Nord is default): "

	i3_custom_theme ${colors_schemas[$OPTION]}
}

ask_zsh() {
	read_input_text "Do you use zsh (Z shell)?"
	if [[ $OPTION == y ]]; then
		read_input_text "Do you want to use antigen?"
		if [[ $OPTION == y ]]; then
			apply_antigen
		else 
			echo -e "${YELLOW}[-] Passed${WHITE}\n"
		fi
	else 
		echo -e "${YELLOW}[-] Passed${WHITE}\n"
	fi
}

configure_devices() {
	echo -e "${YELLOW}[-] Check Network interface"
	replace_line "interface = INTERFACE" "interface = ${IW}" ${configPath}/polybar/modules.conf		
	echo -e "${GREEN}[*] Network interface Applied\n ${WHITE}"

	echo -e "${YELLOW}[-] Check Monitor Device"
	replace_line "monitor = MONITOR" "monitor = ${MONITOR}" ${configPath}/polybar/config		
	echo -e "${GREEN}[*] Monitor Device layout Applied\n ${WHITE}"

	if [ -d /sys/class/power_supply/BAT* ]; then
		BAT=$(ls /sys/class/power_supply/ | grep 'BAT')
		echo $BAT
		echo -e "${YELLOW}[-] Check Battery device"
		replace_line "battery = BAT1" "battery = ${BAT}" ${configPath}/polybar/modules.conf		
		replace_line "modules-right  = memory coreuse wireless-network volume" "modules-right  = memory coreuse wireless-network volume battery" ${configPath}/polybar/config		
		echo -e "${GREEN}[*] Battery configuration Applied\n ${WHITE}"
	fi
}