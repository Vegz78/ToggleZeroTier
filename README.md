# ToggleZeroTier
A script to automatically toggle a ZeroTier connection and add it to the routing table directly from a games folder that executes .sh-scripts inside RetroPie/Emulationstation, or from a Linux command line.
![alt text](https://retrospill.ninja/wp-content/uploads/2020/05/Raspberry_TierZero.jpg)

Added a new 3 step logic instead of the old 2 all-on/all-off, so that one easily can restore ZT broadcast after reboot:<br>
STATE               =>      ACTION<br>
1.ZT off           =>	    Toggle to 2<br>
2.ZT on & BC off	=>	    Toggle to 3<br>
3.ZT on & BC on	=>	    Toggle to 1		

This is a REALLY quick and ugly modifcation of [../gsomoza/ztvpn.sh](https://gist.github.com/gsomoza/662ccfe13d628ec0a6ae0f858a5d99dc) on GitHub, to allow for execution directly from RetroPie, and adding and removing the ZeroTier network from the routing table, so that ZeroTier peers are discovered automatically by
some LAN games. Basically a raw copy with some added sudo and ip route commands... 

The script does what it's supposed to on my home system and won't be very actively supported, updated or maintained.

For similar, but a little more complicated, solutions on Windows, see the [ZeroTier Knowledgebase](https://zerotier.atlassian.net/wiki/spaces/SD/pages/7536695/Problems+With+LAN+Game+Announcements+and+Broadcasts+on+Windows)

# Prerequisites
- Raspberry Pi with Linux (but should work on most Linux distros, as well)
- [ZeroTier](https://www.zerotier.com/download/)
- RetroPie/Emulationstation with [Steam or other games menu folders that execute .sh-scripts](#Example-of-sh-script-games-menu-in-Emulationstation)
<br>(but should also work on other RetroArch installations or from the command line)

# Features
- Automatically toggle(connect&disconnect) a ZeroTier connection
- Add the ZeroTier connection to the routing table, so that certain LAN games that use broadcast network discovery can find the other hosts connected to the ZT-network
- Can be run directly from the RetroPie games list menus or from the command line.

# Setup and usage
1 - Download and copy the script into one of your RetroPie roms folder, typically "/home/pi/RetroPie/roms/..". Make sure it's executable. <br>
    Alternatively, in same folder, run:<BR>
    ```git clone https://github.com/Vegz78/ToggleZeroTier && sudo chmod +x ./ToggleZeroTier/_ToggleZeroTier.sh```

2 - Edit _ToggleZeroTier.sh with the desired global variables correct for your setup(ZeroTier Network ID & Device ID.)

3 - Start RetroPie and navigate to the chosen games list menu.

4 - Run the _ToggleZeroTier entry.

For more detailed setup and usage instructions, [check out this article](https://translate.google.com/translate?hl=no&sl=no&tl=en&u=https%3A%2F%2Fretrospill.ninja%2F2020%2F05%2Fzerotier-pa-raspberry-pi%2F).

# Example of sh script games menu in Emulationstation
Edit the file /etc/emulationstation/es_systems.cfg as inspired by [TechWizTime](https://github.com/TechWizTime/moonlight-retropie).

Add something like this:
```
  <system>
    <name>Steam</name>
    <fullname>Steam</fullname>
    <path>/home/pi/RetroPie/roms/moonlight</path>
    <extension>.sh .SH</extension>
    <command>%ROM%</command>
    <platform>steam</platform>
    <theme>steam</theme>
  </system>
```
# Images
![alt text](https://retrospill.ninja/wp-content/uploads/2020/05/retro2png_13a.jpeg)
![alt text](https://retrospill.ninja/wp-content/uploads/2020/05/retro2png_10.jpeg)
![alt text](https://retrospill.ninja/wp-content/uploads/2020/05/retro2png_12.jpeg)
