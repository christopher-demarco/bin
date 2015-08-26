#!/bin/bash

killall synergys

xrandr --newmode "1400x1050_60.00"  121.75  1400 1488 1632 1864  1050 1053 1057 1089 -hsync +vsync
xrandr --addmode LVDS "1400x1050_60.00"

case $(basename $0) in
    "hires.sh")
        xrandr --output LVDS --mode "1400x1050_60.00"
        ;;
    "lores.sh")
        xrandr --output LVDS --mode "1024x768"
        ;;
    "singlehead.sh")
        xrandr --output LVDS --mode "1400x1050_60.00"
        xrandr --output VGA --off
        ;;
    "home_dualhead.sh")
        xrandr --output LVDS --mode 1400x1050
        xrandr --output  VGA --mode 1280x1024
        xrandr --output VGA --left-of LVDS
        gconftool-2 --type int --set /apps/panel/toplevels/bottom_panel_screen0/monitor 1
        ;;
    "dualhead.sh")
        xrandr --output LVDS --mode 1400x1050
        xrandr --output  VGA --mode 1280x1024
#        xrandr --output VGA --mode 1024x768
        xrandr --output VGA --above LVDS
        gconftool-2 --type int --set /apps/panel/toplevels/bottom_panel_screen0/monitor 1
        ;;
esac

synergys -n $(hostname -f)

