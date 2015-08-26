#!/bin/bash

# Simple script to open the requested document in a new Emacs buffer, 
# starting a new instance of Emacs if none exists.

#				xt="/usr/kde/3.3/bin/konsole -e"
xt="/usr/bin/gnome-terminal -t emacs -x"




#$HOME/bin/myterm.sh emacs -nw "$1" &
#/usr/bin/gnome-terminal -t XEmacs -x gnuclient.xemacs21 -nw 
#/usr/bin/gnuclient "$1" &
#$xt /usr/local/bin/emacsclient -t --alternate-editor=''
/usr/bin/emacsclient -c $1






#xrdb -l ~/.Xresources
# if [ -z $(pgrep gnuserv) ]; then
#     /usr/bin/emacs -e gnuserv-start
# fi
# /usr/bin/gnuclient & 



exit

# $Id: max_it.sh 367 2009-11-08 04:02:17Z cmd $
