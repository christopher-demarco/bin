#!/bin/bash

# Search <repo> for <target>

usage() {
    echo "Usage: $0 <target> <repo_url> --backwards --non-terminal"
    echo "e.g. $0 operations https://svn.maya.com/maya_design/trunk/projects/MAYA"
    exit 1
}

[ -z $1 ] && usage
[ -z $2 ] && usage

target=$1
repo=$2
backwards=$3
goon=$4


#b=$(svn info $2 | sed -ne 's/Revision: \(.*\)/\1/; T; p')
b=$(svn info $2 | sed -ne 's/Revision: \(.*\)/\1/p')

case $backwards in

    "--backwards")
    while [ $b -gt 0 ] ; do 
        svn ls -R $2 -r$b | grep -q $1
        if [ $? -eq 0 ]; then
            echo "SUCCESS: revision $b"
            if [ -z $goon ]; then
                break
            fi
        else
            if [ $(($b % 50)) == 0 ]; then
                echo -n $b
            else
                echo -n "."
            fi
        fi
        b=$(($b - 1))
    done
    ;;


    *)
    i=1
    while [ $i -lt $b ]; do
        svn ls -R $2 -r$i | grep -q $1
        if [ $? -eq 0 ]; then
            echo "SUCCESS: revision $i"
            if [ -z $goon ]; then
                break
            fi
            break
        else
            if [ $(($b % 50)) == 0 ]; then
                echo -n $b
            else
                echo -n "."
            fi
        fi
        i=$(($i + 1))
    done
    ;;


esac

