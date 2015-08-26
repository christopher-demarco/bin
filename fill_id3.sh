#!/bin/bash

usage() { #                  1        2       3       4      5
    echo "Usage: fill_id3.sh <artist> <album> <genre> <year> <path_to_m3u>"
    exit
}

# [ -z $1 ] && usage
# [ -z $2 ] && usage
# [ -z $3 ] && usage
if [ -z $4 ]; then
    y=0000
else
    y=$4
fi
# [ -z $5 ] && usage

k=1

for m in $(cat $5); do
    s=$(basename $m)
    s=$(echo $s | sed -e 's/_/ /g; s/\.mp3$//')
    s=$(echo $s | perl -pe 's/\b(\w)/\U$1/g')
    eval id3ed -q -s \"$s\" -n $1 -a \"$2\" -y $y -g \"$3\" -k $k $m
    k=$(($k + 1))
done

