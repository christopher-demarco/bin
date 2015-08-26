#!/bin/bash

PATH=$PATH:/usr/X11R6/bin

case $HOSTNAME in
    "radish.alephant.net")
    mag=".75"
    ;;
    "onion.alephant.net" | "demarco.prv.maya.com")
    mag=".50"
    ;;
esac

xearth -nostars -proj orth -pos random  -nolabel -mag $mag -wait 600 -night 0 -nomarkers -term 0 -ncolors 16M -png
# $Id: xearth_rand.sh 227 2007-05-30 14:21:26Z cmd $
