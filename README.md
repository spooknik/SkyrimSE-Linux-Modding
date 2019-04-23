# Skyrim SE Linux Modding Guide
A simple guide to how to get up and running with mods in Skyrim SE on Linux 

### Base Install
0. Make sure you have [all requirements](https://github.com/ValveSoftware/Proton/wiki/Requirements) fulfilled to use Proton via Steam Play. Proton requires the latest software.
1. Enable Steam Play via Steam. I am using `3.16`. Yes, `4.2-3` also works but it's not recommended (see below) 
2. Download Skyrim SE
3. Check the game runs. 
4. Download and run [FAudio Builds](https://github.com/Kron4ek/FAudio-Builds/releases/download/19.02/faudio-19.02.tar.xz) from terminal. The command will be something like: `WINEPREFIX="/home/[USER]/.steam/steam/steamapps/compatdata/489830" ./wine_setup_faudio.sh` *Do not* install the lastest build. We neet 19.02 for Proton 3.16. Newer version will break things.
5. Base Install of Skyrim is finished. Check if everything is working as it should. 
6. Enjoy the game as vanilla.

### Modding
1. You can simply copy mods into the data directly and active them in game via the 'mods' button in the main menu. The game tries to make you sign in when you click the 'mods' bottom but just hit the home key to get to your load order.
2. Please note that on Linux files and folders are **case sensitive**. Some modders use `textures` or `Textures`. Keep this in mind when installing mods. For consistancy I put everything in lower case folders. Wine/Proton/Linux doesn't seem to care just as long as everything is consistant. 
3. Wrye Bash is acutally runs very well under wine can be used to install, sorting and activation of mods.
4. If you don't need or want to run any SKSE64 mods, then you good to go. 

### SKSE64
0. Prepare to get your hands dirty. We need to manually patch Proton's files in order to make SKSE64 work. The process is basically the same as this [post](https://www.reddit.com/r/SteamPlay/comments/9uro22/fallout_4_how_to_get_fallout_4_script_extender/). Credit to the author.
1. [Download](https://skse.silverlock.org/) SKSE 64. 
2. Copy all .dlls and .exe to Skyrim folder. **Not Data Folder**. The folder with SkyrimSE.exe. (typical SKSE64 install)
3. Install bbe. `sudo apt install bbe`
4. Download and run [this script](https://raw.githubusercontent.com/spooknik/SkyrimSE-Linux-Modding/master/patch_proton.sh). It will patch your proton. Please note, you will have to edit the script if you are not using Proton 3.16.
5. Right on Skyrim SE in Steam and Go to `properties`. 
6. Click `Set Launch Options`
7. Paste this `xterm -e bash -c "echo Not launching Skyrim SE due to Steam Properties settings. Run \"%command%\" to launch vanilla Skyrim SE; exec bash"` Click Okay.
8. Launch Skyrim SE.
9. Xterm should launch. You can now launch SKSE64 and other things from here.
10. Run command `~/".steam/steam/steamapps/common/Proton 3.16/proton" run skse64_loader.exe` to launch Skyrim SE via SKSE64.
11. Open console once in game and run `getskseversion`
12. If it reports something and doesn't error, then you've suceeded. 
13. You can launch modding programs from Xterm to install and setup mods. `~/".steam/steam/steamapps/common/Proton 3.16/proton" run skse64_loader.exe` or  `~/".steam/steam/steamapps/common/Proton 3.16/proton" run SSEEdit.exe`

### Why not 4.2-3?
* Yes it does work for the most part. But I encontered problems with the audio. Installing FAudio Builds on `4.2-3` fixed the sound problems with NPC voices, but made the audio completely cut out and not come back when going through a loading screen.
* Because we are patching Proton to get SKSE to work, running on `4.2-3` will not be stable. Everytime a proton update is pushed the files need to be patch again. Running on `3.16` is a better option because there will (probably) not be any more updates. 
* As far as I can tell there is no advatage to using `4.2-3` in terms of performance or compatibility.

## Good To Know
* So far as I can tell all SKSE plugin mods (.dll) work as they should. Just add them as you normally would. Engine Fixes also works.
* Untested SkyProc. SkyProc will likely involve some trickery with java. 
* Swiching Proton versions is not a good idea. It will likely cause problems because things will be reset. So only run things run one proton version. For example: `~/".steam/steam/steamapps/common/Proton 4.2/proton" run Wrye\ Bash.exe` then `~/".steam/steam/steamapps/common/Proton 4.2/proton" run skse64_loader.exe` **not** `~/".steam/steam/steamapps/common/Proton 4.2/proton" run Wrye\ Bash.exe` then `~/".steam/steam/steamapps/common/Proton 3.16/proton" run skse64_loader.exe`
* Sometimes Skyrim will hang on exit. You can `alt` + `tab` out and enter `ctrl` + `c`. This might help. Otherwise in most DE you will eventually get the option to force quit. There's 1 in 5 chance of this happening to me. 
* At time of writing (April 2019) **DynDOLOD 2.59 will not fully work** under wine. It used a small program called Texconv to build the .dds textures.  This program is broken under Wine. You can still use DynDOLOD, but you won't be able to generate tree LOD textures and you need to output everything in R8G8B8/R8G8B8A8. [Bug](https://github.com/Microsoft/DirectXTex/issues/128) with Wine described here. My convsation with sheson is [here.](https://forum.step-project.com/topic/13894-dyndolod-beta-for-skyrim-special-edition-and-skyrim-vr-259/?p=234663). 

## Tips and Tricks
* If NPC voices stop working, just re-run the FAudio Builds script.
* Audio can be buggy. In Xterm before launching the game, you can run: `winetricks sound=alsa` to try to switch to ALSA sound. Or `winetricks sound=pulseaudio` for Pulse Audio. It may differ from system to system.
* `shift`+`ins` to paste things into xterm
* Proton will spit out a massive amount of the same error: `ERROR: ld.so: object '/home/steven/.steam/ubuntu12_64/gameoverlayrenderer.so' from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS64): ignored.`
* Wrye Bash plays nice with symbolic links. Meaning you can just link all your downloaded mods to Wrye Bash's Bash Installers folder. 
* For me, Wrye Bash crashes when you try to click and drag plugins in your load order. You can use `ctrl` + `up` or `down` to move plugings around.
