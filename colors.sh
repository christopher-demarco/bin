#!/bin/bash

COLORS=(30 31 32 33 34 35 36 37)
echo $(($RANDOM % ${#COLORS[*]}))

for c in ${COLORS[*]}; do
    echo -e "\033[0;${c}mHello, world!(color 0;${c})"
    echo -e "\033[01;${c}mHello, world!(color 1;${c})"
done



