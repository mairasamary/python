#!/bin/bash
RED="\033[1;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"


PYTHON3=$(whereis /usr/bin/python3)
VIRTUAL_ENV_FOLDER=$PWD/BCPYTHON

exit_if_error() {
	if [ $(($(echo "${PIPESTATUS[@]}" | tr -s ' ' +))) -ne 0 ]; then
		printf "\n\n${RED}ERROR: $1${RESET}\n\n"
		exit 1
	fi
}

if [ "?$PYTHON3" == "" ];
then
    printf "$YELLOW\n\nPython 3 not present. Going to install it...\n$RESET"

    if [ ! -e /usr/local/bin/brew ];
    then
        printf "\n\n$YELLOWBrew required to install Python 3. Going to install it...$RESET\n"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        exit_if_error "Could not install Brew."
    fi

    brew install python3
    exit_if_error "Could not install python 3."
else
    printf "$GREEN\n\nPython 3 already installed!\n$RESET"
fi

printf "\n\n${YELLOW}Creating lightweight virtual environment at $VIRTUAL_ENV_FOLDER...$RESET\n"
python3 -m venv $VIRTUAL_ENV_FOLDER
exit_if_error "Could not create virtual environment for $VIRTUAL_ENV_FOLDER"

printf "\n\n${YELLOW}Copying requirements.txt...$RESET\n"
cp ./requirements.txt $VIRTUAL_ENV_FOLDER/
exit_if_error "Could not copy requirements.txt to folder $VIRTUAL_ENV_FOLDER"

printf "\n\n${YELLOW}Activating new environment...$RESET\n"
source $VIRTUAL_ENV_FOLDER/bin/activate

printf "\n\n${YELLOW}Installing required libraries...$RESET\n"
pip install --no-cache-dir -r requirements.txt
exit_if_error "Could not install required libraries"

rm $VIRTUAL_ENV_FOLDER/requirements.txt

printf "\n\n${GREEN}Required libraries installed! Exiting environment!$RESET\n"

printf "\n\n${BLUE}Run the following to activate your environment:$RESET"
printf "\n\n\t${WHITE}source ${VIRTUAL_ENV_FOLDER}/bin/activate$RESET\n\n"
