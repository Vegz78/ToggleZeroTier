# ToggleZeroTier
A script to automatically toggle a ZeroTier connection and add it to the routing table directly from a games folder that executes .sh-scripts inside RetroPie/Emulationstation, or from a Linux command line.

Added a new 3 step logic instad of the old 2 step, so that one easily can restore ZT broadcast after reboot:<br>
STATE               =>      ACTION<br>
1.ZT off           =>	    Toggle to 2
2.ZT on & BC off	=>	    Toggle to 3
3.ZT on & BC on	=>	    Toggle to 1		

This is a REALLY quick and ugly modifcation of ../gsomoza/ztvpn.sh on GitHub, to allow for execution directly from RetroPie, and adding and removing the ZeroTier network from the routing table, so that ZeroTier peers are discovered automatically by
some LAN games. Basically a raw copy with some added sudo and ip route commands... 

The script does what it's supposed to on my home system and won't be very actively supported, updated or maintained.

# Prerequisites
- Raspberry Pi with Linux (but should work on most Linux distros, as well)
- [ZeroTier](https://www.zerotier.com/download/)
- RetroPie/Emulationstation with [Steam or other games menu folders that execute .sh-scripts](#Example-of-sh-script-games-menu-in-Emulationstation)
<br>(but should also work on other RetroArch installations or from the command line)

# Features
- Automatically toggle(connect&disconnect) a ZeroTier connection
- Add the ZeroTier connection to the routing table, so that certain LAN games find the hosts connected to the ZT-network
- Can be run directly from the RetroPie games list menus or from the command line.

# Usage
1 - Download and copy the script into one of your RetroPie roms folder, typically "/home/pi/RetroPie/roms/..". Make sure it's executable. <br>
    Alternatively, in same folder, run:<BR>
    ```git clone https://github.com/Vegz78/ToggleZeroTier && sudo chmod +x ./ToggleZeroTier/_ToggleZeroTier.sh```

2 - Edit _ToggleZeroTier.sh with the desired global variables correct for your setup(ZeroTier Network ID & Device ID.)

3 - Start RetroPie and navigate to the chosen games list menu.

4 - Run the _ToggleZeroTier entry.

# Example of sh script games menu in Emulationstation
Edit the file /etc/emulationstation/es_systems.cfg as inspired by [TechWizTime](https://github.com/TechWizTime/moonlight-retropie).

Add something like this:
```
  <system>
    <name>Steam</name>
    <fullname>Steam</fullname>
    <path>/home/pi/RetroPie/roms/moonlight_Berry</path>
    <extension>.sh .SH</extension>
    <command>%ROM%</command>
    <platform>steam</platform>
    <theme>steam</theme>
  </system>
```
