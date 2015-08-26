#!/bin/bash

# Walk back through the revisions and print corresponding diffs

root=$1

if [ -z $root ]; then
		echo "Please supply a root."
		exit
fi

svnroot=`svn info $root | grep URL | cut -d" " -f2 | awk -F'//' '{ print $2 }'`
svnhost=`echo $svnroot | cut -d"/" -f 1`
svnroot=`echo $svnroot | cut -d"/" -f 2- --output-delimiter=";" | python -c "import sys; print '/'.join(sys.stdin.read().split(';')[:-1])"`

n=`ssh $svnhost "svnlook youngest /$svnroot"`
m=$(($n-1))

while [ $m -gt 0 ]; do
		echo Revisions $m : $n
		svn diff -r $m:$n
		echo "= = == === ===== ======== ============= ====================="

		n=$m
		m=$(($m - 1))
done




