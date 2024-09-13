#!/bin/bash

# ===========================================
#
#    Fedora GSDE Installer for Humans ;-)
#    by Nacroni
#    2024 | GPL v3 License
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
			sudo dnf install git || echo "Whoops! Something went wrong. Maybe try installing Git on your own?"
		fi


# Install deps for GSDE
	printf "Installing dependencies...\n"
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	cat ./deps/gnustep_desktop-deps-fedora.list | xargs sudo dnf install -y
	sudo dnf install xorg-x11-server-Xdmx xorg-x11-server-Xephyr xorg-x11-server-Xnest xorg-x11-server-Xorg xorg-x11-server-Xvfb xorg-x11-server-common xorg-x11-server-devel xorg-x11-server-source -y ## just to make sure ;-)

# Clone GSDE Git
	mkdir ~/GSDEGit/
	cd ~/GSDEGit/ && git clone https://github.com/onflapp/gs-desktop
	printf "The GSDE folder should now be located in '~/GSDEGit/gs-desktop/' or '/home/$USER/GSDEGit/gs-desktop/'.\n"

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
