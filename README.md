# Skyrim SE Linux Modding Guide
A simple guide to how to get up and running with mods in Skyrim SE on Linux 

### Base Install
0. Make sure you have [all requirements](https://github.com/ValveSoftware/Proton/wiki/Requirements) fulfilled to use Proton via Steam Play. Proton requires the latest software.
1. Enable Steam Play via Steam. I am using `4.2-3` for this guide. 
2. Download Skyrim SE
3. Check the game runs. 
4. Download and run [FAudio Builds](https://github.com/Kron4ek/FAudio-Builds) from terminal. The command will be something like: `WINEPREFIX="/home/[USER]/.steam/steam/steamapps/compatdata/489830" ./wine_setup_faudio.sh` NOTE: In most cases this is required to hear NPC voices in game. If you don't have this problem don't install it. 
5. Base Install of Skyrim is finished. Check if everything is working as it should. 
6. Enjoy the game as vanilla.

### Modding
1. You can simply copy mods into the data directly and active them in game via the 'mods' button in the main menu. 
2. Please note that on Linux files and folders are **case sensitive**. Some modders use `textures` or `Textures`. Keep this in mind when installing mods. For consistancy I put everything in lower case folders. Wine/Proton/Linux doesn't seem to care just as long as everything is consistant. 
3. Wrye Bash is acutally runs very well under wine can be used to install, sorting and activation of mods.

### SKSE64
0. Prepare to get your hands dirty. We need to manually patch Proton's files in order to make SKSE64 work. The process is basically the same as this [post](https://www.reddit.com/r/SteamPlay/comments/9uro22/fallout_4_how_to_get_fallout_4_script_extender/). Credit to the author.
1. Download SKSE 64. 
2. Copy all .dlls and exe to Skyrim folder. **Not Data Folder**. The folder with SkyrimSE.exe. 
3. Install bbe. `sudo apt install bbe`
4. Download and run this script. It will patch your proton. You may need to edit the script to find your install of proton. 
