#!/bin/sh

# $Id: fibgraph.sh 362 2009-08-28 19:10:36Z cmd $
# $URL: https://svn.alephant.net/svn/home/trunk/bin/fibgraph.sh $

a=1 ; b=1 
echo '#'; echo '#'
while ( true );  do
    c=$(($a + $b)) 
    [ $c -gt 77 ] && break
    a=$b ; b=$c
    n=0; while [ $n -lt $c ]; do
	echo -n '#'
	n=$(($n+1))
	done
    echo ''
done

#
#
##
###
#####
########
#############
#####################
##################################
#######################################################
