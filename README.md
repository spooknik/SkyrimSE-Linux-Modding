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
2. Copy all .dlls and .exe to Skyrim folder. **Not Data Folder**. The folder with SkyrimSE.exe. (typical SKSE64 install)
3. Install bbe. `sudo apt install bbe`
4. Download and run [this script](https://raw.githubusercontent.com/spooknik/SkyrimSE-Linux-Modding/master/patch_proton.sh). It will patch your proton. You may need to edit the script to find your install of proton. 
5. Right on Skyrim SE in Steam and Go to `properties`. 
6. Click `Set Launch Options`
7. Paste this `xterm -e bash -c "echo Not launching Skyrim SE due to Steam Properties settings. Run \"%command%\" to launch vanilla Skyrim SE; exec bash"` Click Okay.
8. Launch Skyrim SE.
9. Xterm should launch. You can now launch SKSE64 and other things from here.
10. Run command `~/".steam/steam/steamapps/common/Proton 4.2/proton" run skse64_loader.exe` to launch Skyrim SE via SKSE64.
11. Open console once in game and run `getskseversion`
12. If it reports something, then you've suceeded. 
13. From Xterm install FAudio Builds again, if needed.
14. You can launch Wrye Bash from Xterm to install and setup mods. Then launch SKSE the way outlined above. Your load order will be preserved.  


## Good To Know
* So far as I can tell all SKSE plugin mods (.dll) work as they should. Just add them as you normally would. 
* Audio can be buggy. In Xterm before launching the game, you can run: `winetricks sound=alsa` to try to switch to ALSA sound. Or `winetricks sound=pulseaudio` for Pulse Audio. It may differ from system to system. 
* No idea if this works in Skyrim VR. Please don't ask. 
* Untested with DynDOLOD and SkyProc. DynDOLOD will probably run okay. Just run it via Xterm. SkyProc will likely involve some trickery with java. 
