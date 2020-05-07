#!/bin/bash
###################################################################################
#                                                                                 #
# A REALLY quick and ugly modifcation of gsomoza/ztvpn.sh on GitHub, to allow for #
# execution directly from RetroPie, and adding and removing the ZeroTier network  #
# from the routing table, so that ZeroTier peers are discovered automatically by  #
# som LAN games. Basically a raw copy with some sudo and ip route commands...     #
#                                                                                 #
###################################################################################

# Global variables
ZT_NETWORK="xxxxxxxxxxxxxxxx" #ZeroTier Network ID
ZT_DEVICE="yyyyyyyyyy" #ZeroTier local network device ID, connected to the above network, as shown from e.g. "ifconfig"

# colors
RCol='\033[0m'    # Text Reset
LGra='\033[0;37m';
Red='\033[0;31m';
Gre='\033[0;32m'; 
Yel='\033[0;33m'; 

display_usage() {
    echo -e "\nThis script enables / disables the ZeroTier gateway for this device on network $ZT_NETWORK \n\n"
    echo -e "Usage:\n    $0 <command> | --help\n"
    echo -e "Commands:\n"
    echo -e "    (e)nable\tEnables the VPN functionality\n"
    echo -e "    (d)isable\tDisables the VPN functionality\n"
    echo -e "    (s)tatus\tShows the status of the VPN network\n"
}

# check if the zerotier-cli binary is installed
command -v zerotier-cli >/dev/null 2>&1 || \
	{ echo -e >&2 "This script requires ${Yel}zerotier-cli${RCol} to run, but it's not installed. Aborting."; \
	  echo -e >&2 "You can install ZeroTier One by running:\n    ${LGra}curl -s https://install.zerotier.com/ | bash${RCol}";
	  exit 2; 
	}

# ask for the network ID the user wants to join
if [ $ZT_NETWORK == "NETWORK_ID" ]; then
	echo -e "You haven't configured a ZeroTier network for this script yet."

	while true; do
	    read -p "Please enter the network ID you whish to use: " ZT_NETWORK

	    if [ -z $ZT_NETWORK ] 
    	then true;
    	else
	    	break
	    fi;
    done

    echo -en "\nTo avoid being asked this again in the future, please edit this script by setting the "
    echo -e "ZT_NETWORK variable to your desired network ID.\n"
fi

# check if we're connected to the correct ZT network
if sudo zerotier-cli listnetworks | grep -Fq $ZT_NETWORK
then
    sudo zerotier-cli leave $ZT_NETWORK
    echo -e "$ZT_NETWORK disconnected..."
    sudo ip route delete 255.255.255.255/32 dev $ZT_DEVICE
    exit 0	 
else
    sudo zerotier-cli join $ZT_NETWORK
    sleep 3
    if sudo zerotier-cli listnetworks | grep -Fq $ZT_NETWORK
    then
        sudo zerotier-cli /network/$ZT_NETWORK
        echo -e "$ZT_NETWORK connected!..."
	sudo ip route add 255.255.255.255/32 dev $ZT_DEVICE
        exit 0
    else
        echo -e "$ZT_NETWORK did not connect, ERROR..."
    exit 3
    fi
fi
