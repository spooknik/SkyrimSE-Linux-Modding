# Skyrim SE Linux Modding Guide
A simple guide to how to get up and running with mods in Skyrim SE on Linux 

### Base Install
0. Make sure you have [all requirements](https://github.com/ValveSoftware/Proton/wiki/Requirements) fulfilled to use Proton via Steam Play. Proton requires the latest software.
1. Enable Steam Play via Steam. I am using `4.2-3` for this guide. 
2. Download Skyrim SE
3. Check the game runs. 
4. Download and run [FAudio Builds](https://github.com/Kron4ek/FAudio-Builds) from terminal. The command will be something like: `WINEPREFIX="/home/[USER]/.steam/steam/steamapps/compatdata/489830" ./wine_setup_faudio.sh` NOTE: In most cases this is required to hear NPC voices in game. If you don't have this problem don't install it. 
5. Base Install of Skyrim is finished. Check if everything is working as it should. 

### Modding
1. You can simply copy mods into the data directly and active them in game via the 'mods' button in the main menu. 
2. Please note that on Linux files and folders are **case sensitive**. Some modders use `textures` or `Textures`. Keep this in mind when installing mods. For consistancy I put everything in lower case folders. 
