#!/bin/fish

set -l newws_num (swaymsg -t get_workspaces -r | jq '[.[].num] | map(select(. < 99)) | [max + 1, 1] | max')

swaymsg workspace number $newws_num
swaymsg exec -- (read)

