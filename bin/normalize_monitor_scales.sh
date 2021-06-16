#!/bin/bash

nvidia-settings --assign CurrentMetaMode="DP-1: 3840x2160 +3840+0 { ViewPortIn=3840x2160, ViewPortOut=3840x2160 }"
xrandr --output DP-1 --scale 1x1 -r 60
