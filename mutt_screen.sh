#!/bin/bash

xrdb -l ~/.Xresources

unset SCR
SCR=$(/usr/bin/screen -ls | grep mutt)
if [ -z "$SCR" ]; then
    /usr/bin/screen -dmS mutt mutt
    /usr/bin/screen -wipe
else
    /home/cmd/bin/myterm.sh screen -e^]] -DR mutt 
fi

exit
