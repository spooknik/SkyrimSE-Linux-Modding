#!/bin/bash
DIRECTORY=$HOME/.steam/root/compatibilitytools.d/
echo "Installing Proton For Skyrim SE"
## Unzip to temp
unzip skyrim-proton.zip -d /tmp/
##Install
mv /tmp/skyrim-proton $DIRECTORY
