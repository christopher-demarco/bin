#!/bin/bash

myname=$(basename $0)

if [ $myname == 'tinyterm.sh' ]; then
    myterm='xterm -e'
else

    case $HOSTNAME in
        "celery")
            myterm='aterm -e'
            ;;
        "onion.alephant.net" | "radish.alephant.net" | "demarco.prv.maya.com")
#            myterm='xfce4-terminal -x'
            myterm='aterm -e'
            ;;
        *)
            myterm='xterm -e'
            ;;
    esac
fi


if [ $# -eq 0 ]; then
    command=bash        
else
    command=$@
fi

exec $myterm $command
