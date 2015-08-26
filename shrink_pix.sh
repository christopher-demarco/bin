#!/bin/sh

name=$1
ext=$(echo $name | awk -F. '{print $2}')
name=$(echo $name | awk -F. '{print $1}')

small="${name}_small.${ext}"


convert -resize 512x341 $1 $small
# $Id: shrink_pix.sh 4 2005-08-09 19:43:45Z cmd $
