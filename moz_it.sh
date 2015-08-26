#!/bin/bash

# Simple script to  open the requested document  in a new mozilla tab,
# starting mozilla if required.

file=$@
moz="/usr/bin/firefox"


# Apparantly...
#  - can't have space after the comma
#  - can't use single-quotes
# <shrug>
#$moz -remote "openURL($file,new-tab)" || $moz "$file" &

# Firefox 0.9 is broken!
# See Bug 246166
# WTF!?
cd `dirname $moz`
./run-mozilla.sh ./mozilla-xremote-client -a firefox "openURL($file,new-tab)" || $moz "$file" &


# # ## ### ##### ######## ############# #####################
# CHANGELOG
# Thu Jun 17 09:57:20 MYT 2004
#   - deleted old filename-munging code
#   - changed $moz invocation to fix FireFox 0.9 bug >:(
#   Christopher DeMarco <cdemarco@fastmail.fm>

# $Id: moz_it.sh 4 2005-08-09 19:43:45Z cmd $
