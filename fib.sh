#!/bin/bash

# $Id: fib.sh 362 2009-08-28 19:10:36Z cmd $
# $URL: https://svn.alephant.net/svn/home/trunk/bin/fib.sh $

x='#'
[ $1 ] && x=$1

a=1 ; b=1 ; c=$(($a + $b))
echo -n $x ; echo -n " $x"
while [ $c -lt 22 ];  do
    echo -n ' ' 
    n=0
    while [ $n -lt $c ]; do
	echo -n $x
	n=$(( $n + 1))
    done
    a=$b ; b=$c ; c=$(($a + $b)) 
done
echo 

# # ## ### ##### ######## ############# #####################
