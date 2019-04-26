#!/bin/bash

set -e
cd ~/".steam/steam/steamapps/common/Proton 3.16/dist/lib64/wine/"
if [ -f ntdll.dll.so-backup ]; then
   echo "ntdll.dll.so-backup already exists.  Aborting to avoid overwriting it."
   exit 1
fi
cp ntdll.dll.so ntdll.dll.so-backup

bbe -e 's/\x77\x4d\x48\x01\xfe\x48\x39\xce/\x73\x4d\x48\x01\xfe\x48\x39\xce/' <ntdll.dll.so-backup |
bbe -e 's/\x45\x31\xc0\x48\x89\xd9\x31\xf6/\x41\x89\xe0\x48\x89\xd9\x31\xf6/' |
bbe -e 's/\x45\x31\xc0\x4c\x89\xd7\x41\xb9\x2d\x00\x80\x01/\x41\x89\xe0\x4c\x89\xd7\x41\xb9\x2d\x00\x80\x01/' >ntdll.dll.so
echo "Proton has been patched."
