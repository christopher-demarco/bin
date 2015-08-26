#!/bin/sh

b=0
xset b 99 $b
while [ $b -lt 20 ] 
do
echo -ne '\a'
b=$(( $b + 1 ))
    xset b 99 $b
    sleep .01
done
# $Id: ding.sh 4 2005-08-09 19:43:45Z cmd $
