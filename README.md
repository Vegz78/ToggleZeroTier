# ToggleZeroTier
A script to automatically toggle a ZeroTier connection and add it to the routing table directly from the RetroPie/Emulationstation game menu from a Raspberry Pi with RetroPie/Emulationstation.

This is a REALLY quick and ugly modifcation of ../gsomoza/ztvpn.sh on GitHub, to allow for execution directly from RetroPie, and adding and removing the ZeroTier network from the routing table, so that ZeroTier peers are discovered automatically by
some LAN games. Basically a raw copy with some added sudo and ip route commands... 

The script does what it's supposed to on my home system and won't be supported, updated or maintained actively.

# Prerequisites
-Raspberry Pi with Linux
-ZeroTier
-RetroPie/Emulationstation

# Features
- Automatically update a ZeroTier connection 
- Can be run directly from the RetroPie Moonlight/Steam games list.
- Restarts EmulationStation to update the games list with new entries.
- Game files already present and not previously created by this script are not overwritten.

# Usage: 
1 - Download and copy the script into one of your RetroPie roms folder, typically "/home/pi/RetroPie/roms/..". Make sure it's executable. <br>
    Alternatively, in same folder, run:<BR>
    git clone https://github.com/Vegz78/ToggleZeroTier && sudo chmod +x _ToogleZeroTier.sh

2 - Edit _ToggleZeroTier.sh with the desired global variables correct for your setup(ZeroTier Network ID & Device ID.)

3 - Start RetroPie and navigate to the chosen games list menu.

4 - Run the _ToggleZeroTier entry.
