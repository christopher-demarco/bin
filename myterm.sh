#!/bin/bash

myname=$(basename $0)
if [ $# -eq 0 ]; then

    command=bash        
else
    command=$@
fi

if $(echo $command | egrep -q '^emacs'); then
    title="emacs"
else
    title=$command
fi



if [ $myname == 'tinyterm.sh' ]; then
    myterm='xterm'
else
#    myterm='xfce4-terminal -x'
#    myterm='/usr/bin/gnome-terminal -x'

    case $HOSTNAME in
        "celery")
        myterm='aterm -e'
        ;;
#         "onion.alephant.net" | "radish.alephant.net" |"demarco.prv.maya.com")
#         myterm='xfce4-terminal -x'
# #       myterm='aterm -e'
#         ;;
#         "owl")
#         myterm='xfce4-terminal -x'
# #        myterm='mrxvt -e'
#         ;;
        *)
        myterm="/usr/bin/gnome-terminal -t ${title} -x ${command}"
        ;;
    esac

fi

exec $myterm
