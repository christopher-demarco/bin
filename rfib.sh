#!/bin/sh



# #  #   #     #        #             #                     #

x='#'
[ $1 ] && x=$1

a=1 ; b=1 ; c=$(($a + $b))
echo -n "$x "
while [ $c -lt 22 ];  do
    echo -n $x 
    n=0
    while [ $n -lt $c ]; do
	echo -n ' '
	n=$(( $n + 1))
    done
    a=$b ; b=$c ; c=$(($a + $b)) 
done
echo $x





# $Id: rfib.sh 132 2006-08-24 20:27:01Z cmd $
