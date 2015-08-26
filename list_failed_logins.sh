#!/bin/bash

if [ $1 ]; then 
    lf=$1
else
    if [ $HOSTNAME == "carrot" ]; then
        lf="/var/log/everything/current"
    else
        lf="/var/log/everything"
    fi
fi 

declare -a brutes
for b in `grep "Invalid user" $lf | \
    grep -oE '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' |\
    sort | uniq`; do
        brutes[$((${#brutes[@]} +1))]=$b  # what lovely syntax >:-b
done


if [ ${#brutes[@]} -gt 0 ]; then
    echo "SSH brutes:"
    for b in ${brutes[@]}; do
        echo $b
    done
fi

