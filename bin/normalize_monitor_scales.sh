#!/bin/bash

xrandr --output DP-2 --primary --scale 1x1 --output HDMI-0 --scale 1x1
nvidia-settings --assign CurrentMetaMode="HDMI-0: 3440x1440 +0+0 { Stereo = PassiveLeft }, DP-2: 3840x2160 +3440+0 { Stereo=PassiveRight, ViewPortIn=2560x1440, ViewPortOut=3840x2160 }"
