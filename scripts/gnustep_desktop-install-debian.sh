#!/bin/bash

# ===========================================
#
#    Debian GSDE Installer for humans ;-)
#    by Nacroni
#    2024 | GPL3 license
#
# ===========================================

# Intro
	printf "This is the automated GNUstep Desktop installer.\nThis installer uses the steps provided at the responsible GitHub repo for installing GNUstep Desktop.\n"
	read -rsp $'\nPress any key to continue, press CTRL+C to cancel.\n' -n1 key

# Check for commands
	## Git
		if ! command -v git &> /dev/null
		then
			printf "Git is missing, installing Git...\n"
			sudo apt install git || echo "Whoops! Something went wrong. Maybe try installing Git on your own?"
		fi

	## Sudo
		if ! command -v sudo &> /dev/null
		then
			printf "Sudo is missing, installing Sudo\n"
			apt install sudo || YOUARENOTWORTHY=true

			if [ "$YOUARENOTWORTHY" = true ]; then
				printf "\nYou do not have superuser permissions. Please try again as superuser.\n"
				exit 1
			fi
			printf "Sudo should now be installed.\n"
			printf "To give your user sudo permissions, do:\n"
			printf "# usermod -aG sudo $USER\n"
			printf "as root (either logging in as root or doing 'su -')\n"
			printf "Please run this installer as Sudo on your main account.\n"
			exit
		fi

# Clone GSDE Git
	mkdir ~/GSDEGit/
	cd ~/GSDEGit/ && git clone https://github.com/onflapp/gs-desktop
	printf "The GSDE folder should now be located in '~/GSDEGit/gs-desktop/' or '/home/$USER/GSDEGit/gs-desktop/'.\n"

# Install deps for GSDE
	printf "Installing dependencies...\n"
	cat ~/GSDEGit/gs-desktop/Dependencies/debian.txt | tr "\n" " " | xargs sudo apt install -y 
	sudo apt install xorg -y ## just to make sure ;-)

# Fetch the world!
	cd ~/GSDEGit/gs-desktop/
	sudo chmod +x ~/GSDEGit/gs-desktop/fetch_world.sh
	cd ~/GSDEGit/gs-desktop/
	./fetch_world.sh
	printf "The world has been fetched!\n"

# Build the world!
	cd ~/GSDEGit/gs-desktop/
	sudo -E ./build_world.sh
	printf "The world has been built!\n"

# Install GSDE
	## Run the WDM installer in the Git repo
		printf "Before you continue with the installation, if you need to switch to TTY1 (to logout, or do something important), you can do such by using Ctrl + Alt + F1.\n"
		read -rsp $'\nPress any key to continue, press CTRL+C to cancel.\n' -n1 key
		cd ~/GSDEGit/gs-desktop/
		sudo chmod +x ./config/install_wdm.sh
		sudo ./config/install_wdm.sh
		printf "WDM has been installed! :-)\n"

printf "GNUstep Desktop has been successfully installed!\n" && exit
