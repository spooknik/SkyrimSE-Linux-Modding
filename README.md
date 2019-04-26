# Skyrim SE Linux Modding Guide
A simple guide to how to get up and running with mods in Skyrim SE on Linux 

* [Base Install](#base-install)
* [Basic Modding](#basic-modding)
* [SKSE64](#skse64)

### Base Install
0. Make sure you have [all requirements](https://github.com/ValveSoftware/Proton/wiki/Requirements) fulfilled to use Proton via Steam Play. Proton requires the latest software.
1. Enable Steam Play via Steam. You must use 3.16-4. 
2. Download Skyrim SE
3. Check the game runs.
4. Download [install_audio.sh](https://github.com/spooknik/SkyrimSE-Linux-Modding/blob/master/install_audio.sh)
5. Run `install_audio.sh` This will patch the audio to work. 
6. Base Install of Skyrim is finished. Check if everything is working as it should. 
7. Enjoy the game as vanilla.

### Basic Modding
1. You can simply copy mods into the data directly and active them in game via the 'mods' button in the main menu. 
2. Please note that on Linux files and folders are **case sensitive**. Some modders use `textures` or `Textures`. Keep this in mind when installing mods. For consistancy I put everything in lower case folders. Wine/Proton/Linux doesn't seem to care just as long as everything is consistant. 
3. Wrye Bash is acutally runs very well under wine can be used to install, sorting and activation of mods.
4. If you don't need or want to run any SKSE64 mods, then you good to go. 

### SKSE64
1. Quit Steam
2. [Download](https://github.com/spooknik/SkyrimSE-Linux-Modding/releases/download/1.0/skyrim-proton-1.0.zip) Skyrim-SE-Proton
3. Extract & Run `install_proton.sh`
4. Restart Steam and go to Skyrim SE's properties. 
5. Click the `Force the use of a specific Steam Play compatibility tool`. Select `Proton 3.16-4 for Skyrim SE` NOTE:  Skyrim SE will now run with a custom local version of Proton that will work with SKSE64. You must use this version for SKSE64 modding
6. Click `Set Launch Options`
7. Paste `xterm && echo %command% >/dev/null` NOTE: This is a little trickey to get Steam to launch xTerm when you click Play on the game. You can replace `xterm` with `skse64_loader.exe` to directly launch SKSE64 from Steam.
8. Play Skyrim SE. A terminal should launch.
9. Launch the game with SKSE: `~/".steam/root/compatibilitytools.d/skyrim-proton/proton" run skse64_loader.exe`
10. Once at the main menu check that SKSE is loaded: `getskseversion`. It should return a version number for SKSE.
11. Close Skyrim SE and xTerm should still be open. You can run all of your modding tools here. For example: `~/".steam/root/compatibilitytools.d/skyrim-proton/proton" run SSEEdit.exe` or `~/".steam/root/compatibilitytools.d/skyrim-proton/proton" run Mopy/Wrye Bash.exe`.


### Why not 4.2-3?
* Yes it does work for the most part. But I encountered problems with the audio. Installing FAudio Builds on `4.2-3` fixed the sound problems with NPC voices, but made the audio completely cut out and not come back when going through a loading screen.
* Because we are patching Proton to get SKSE to work, running on `4.2-3` will not be stable. Every time a proton update is pushed the files need to be patch again. Running on `3.16` is a better option because there will (probably) not be any more updates. 
* As far as I can tell there is no advantage to using `4.2-3` in terms of performance or compatibility.

## Good To Know
* So far as I can tell all SKSE plugin mods (.dll) work as they should. Just add them as you normally would.
* Untested SkyProc. SkyProc will likely involve some trickery with java. 
* Swiching Proton versions is not a good idea. It will likely cause problems because things will be reset. So only run things run one proton version. For example: `~/".steam/steam/steamapps/common/Proton 4.2/proton" run Wrye\ Bash.exe` then `~/".steam/steam/steamapps/common/Proton 4.2/proton" run skse64_loader.exe` **not** `~/".steam/steam/steamapps/common/Proton 4.2/proton" run Wrye\ Bash.exe` then `~/".steam/steam/steamapps/common/Proton 3.16/proton" run skse64_loader.exe`
* Sometimes Skyrim will hang on exit. You can `alt` + `tab` out and enter `ctrl` + `c`. This might help. Otherwise in most DE you will eventually get the option to force quit. There's 1 in 5 chance of this happening to me. 
* At time of writing (April 2019) **DynDOLOD 2.59 will not fully work** under wine. It used a small program called Texconv to build the .dds textures. This program is broken under Wine. You can still use DynDOLOD, but you won't be able to generate tree LOD textures and you need to output everything in R8G8B8/R8G8B8A8. [Bug](https://github.com/Microsoft/DirectXTex/issues/128) with Wine described here. My convsation with sheson is [here.](https://forum.step-project.com/topic/13894-dyndolod-beta-for-skyrim-special-edition-and-skyrim-vr-259/?p=234663). 

## Tips and Tricks
* If NPC voices stop working, just re-run the `install_audio.sh` script.
* Audio can be buggy. In Xterm before launching the game, you can run: `winetricks sound=alsa` to try to switch to ALSA sound. Or `winetricks sound=pulseaudio` for Pulse Audio. It may differ from system to system.
* `shift`+`ins` to paste things into xterm
* Proton will spit out a massive amount of the same error: `ERROR: ld.so: object '/home/steven/.steam/ubuntu12_64/gameoverlayrenderer.so' from LD_PRELOAD cannot be preloaded (wrong ELF class: ELFCLASS64): ignored.`
* Wrye Bash plays nice with symbolic links. Meaning you can just link all your downloaded mods to Wrye Bash's Bash Installers folder. 
* For me, Wrye Bash crashes when you try to click and drag plugins in your load order. You can use `ctrl` + `up` or `down` to move plugings around.
