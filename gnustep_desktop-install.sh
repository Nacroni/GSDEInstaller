#!/bin/bash

# ==========================================
#
#   GNUstep Desktop installer main :-)
#   by Nacroni
#   2024 | GPL v3 License
#
# ==========================================

Distro=$(lsb_release -is 2>/dev/null)

if [ "$Distro" == "Debian" ]
	then
		chmod +x ./scripts/gnustep_desktop-install-debian.sh
		./scripts/gnustep_desktop-install-debian.sh || printf "Install failure"; exit 1
	elif [ "$Distro" == "Fedora" ]
		then
			chmod +x ./scripts/gnustep_desktop-install-fedora.sh
			./scripts/gnustep_desktop-install-fedora.sh || printf "Install failure"; exit 1
	else
		printf "This distro of GNU/Linux is not supported.\n"
		exit 1
fi
