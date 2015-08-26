#!/bin/sh


old=440
old=`grep xset ~/.xsession | awk '{ print $4 }'`

alias bset="xset b 99 "
if [ $TERM == "linux" ] ; then
    alias bset="setterm -bfreq "
fi

alias bel="echo -en '\a'"

    a=21 ; b=34
    c=$(( $a + $b ))
    bset $a ; bel
    sleep 0 
    bset $b ; bel
    sleep 0
    bset $c ; bel
    while [ $c -lt 17711 ] ; do
	sleep 0
	a=$b
	b=$c
	c=$(( $a + $b))
	bset $c ; bel
    done

xset b 100 $old 50
# $Id: atari.sh 4 2005-08-09 19:43:45Z cmd $
