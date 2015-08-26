#!/bin/bash

SUM=0

while read LINE; do
    [ -z $LINE ] && continue
    SUM=$(echo $SUM+$LINE | bc)
done

echo $SUM


