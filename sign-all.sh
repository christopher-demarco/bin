#!/bin/bash


for f in * ; do 
		/usr/bin/gpg -sa $f
done
# $Id: sign-all.sh 4 2005-08-09 19:43:45Z cmd $
