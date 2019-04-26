#!/bin/bash
echo "Installing FAudio for Skyrim SE"
cd faudio-19.02
WINEPREFIX="$HOME/.steam/steam/steamapps/compatdata/489830" ./wine_setup_faudio.sh
