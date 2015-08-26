#!/bin/sh

moz=firefox
#moz="opera --remote 'openURL(\'http://www.google.com\', new-window)'"
#moz="opera --remote 'openURL(nil, new-window)'"

#$moz -remote "openURL(,new-window)" && $moz 
$moz $1
# $Id: new_moz_window.sh 306 2008-01-10 21:58:23Z cmd $
