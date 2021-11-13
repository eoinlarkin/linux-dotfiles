#!/bin/sh
# get the correct actual monitor names with
# xrandr | awk ' /connected/ { print $1, $2 }'
mon1=eDP-1
mon2=DP-1-1
# wait 3

if xrandr | grep "$mon2 disconnected"; then
#     echo 'Xft.dpi: 220' > ~/.Xresources
      xrandr --output "$mon1" --auto --output  --auto --scale 1x1 --right-of eDP-1

elif xrandr | grep "$mon2 connected"; then
      xrandr --output "$mon1" --off --output "$mon2" --auto --scale 1x1
#     xrandr --output "$mon1" --off --output "$mon2" --auto --scale 2x2
#     echo '' > ~/.Xresources
fi
