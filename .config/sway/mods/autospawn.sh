#!/usr/bin/env bash

# autospawn for swaywm, by n7ewx
#   sends a msg when the named workspace is created
#
#   known issue: it is very possible to change to a different
#   workspace before the msg is processed.
#   
#   this process stays alive, monitoring workspace events.
#   be careful not to start multiple instances of the script
#   for the same workspace/msg combination or the msg
#   will be sent multiple times for each created workspace
#   (unless that's what you want :-))
#
#   the process will auto-quit when the sway config reload
#   event is sent. in sway config, usually you should use
#   exec_always.

# usage: ./autospawn.sh <workspace_name> <msg>

# sway config example:
#   set $autospawn ~/path/to/autospawn.sh
#   set $term alacritty
#   set $ws_term 1:term
#   bindsym $mod+return workspace number $ws_term
#   exec_always $autospawn $ws_term exec $term
#
#   set $ws_bf 2:bash-fish
#   bindsym $mod+shift+return workspace number $ws_bf
#   exec_always $autospawn $ws_bf exec $term -e fish, exec $term -e bash

# you may need to use single quote to get command arguments
# passed the right way:
#   exec_always $autospawn config exec alacritty -e fish -c '"vim ~/.config/fish/config.fish"'
#

dirself=$(dirname $0)

# get arguments
ws=$1 && shift

select='.change=="init" and .current?.name=="'"$ws"'"'

while read -r wsinit; do
  [ "$wsinit" = "match" ] && swaymsg -- "$@"
done < <(${dirself}/selectevt.sh % "$select")
