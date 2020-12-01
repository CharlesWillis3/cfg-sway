#!/usr/bin/env fish

argparse --name=set_random_wallpaper 'h/help' 's/set=' -- $argv or return
set -xU SWAYBGSET $_flag_set
set -xU SWAYBG (random choice ~/.local/share/wallpapers/$_flag_set/*.*)
echo $SWAYBGSET
echo $SWAYBG
swaymsg output "*" bg "$SWAYBG" fill
