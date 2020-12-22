#!/usr/bin/env bash

# autospawn.sh for swaywm, by n7ewx:
#   sends a message using swaysmg each time
#   a workspace of the given name is created.
#   does nothing when focusing an existing workspace.
#
#   known issue: it is very possible to change to a different
#   workspace before the message is processed. if spawning
#   new windows, you'll need to wait on the new workspace
#   for the windows to be created, or they'll be created on
#   whichever workspace you have changed to.
#
#   this process stays alive, monitoring workspace events.
#   be careful not to start multiple instances of the script
#   for the same workspace/message combination or the message
#   will be sent multiple times for each created workspace
#   (unless that's what you want :-))

# usage: ./autospawn.sh [trace] <workspace_name> <message>

# sway config example:
#   set $autospawn ~/path/to/autospawn.sh
#   set $term alacritty
#   set $ws_term 1:term
#   bindsym $mod+return workspace number $ws_term
#   exec $autospawn $ws_term exec $term
#
#   set $ws_bf 2:bash-fish
#   bindsym $mod+shift+return workspace number $ws_bf
#   exec $autospawn $ws_bf exec $term -e fish, exec $term -e bash

# you may need to use single quote to get command arguments
# passed the right way:
#   exec $autospawn config exec alacritty -e fish -c '"vim ~/.config/fish/config.fish"'
#
# enable trace logging to see how bash is expanding commands:
#   exec $autospawn trace $workspace_term exec $term
#
# tracing appends to the log, which can be found at
#   ~/autospawn_<workspace_name>_<message_tag>.trace
# trace logging should be turned off when no longer needed
#

#####################
# setup trace logging
#   this section can be safely removed
#
XFD=57 # file descriptor to use for the log file
if [ $1 = "trace" ]; then
  shift
  eval "exec $XFD>>~/autospawn_$1_$(md5sum<<<$* | cut -c 1-8).trace"
  BASH_XTRACEFD=$XFD
  exec 1>&$BASH_XTRACEFD 2>&$BASH_XTRACEFD
  echo
  echo =====$(date)=====
  echo $@
  set -x
fi
#
#
#####################

# get arguments
ws=$1 && shift

# the jq filter
#   selects the workspace/init event for the named workspace
#   prints true for a matching event
#   events that don't match will not produce output
filter='select(.change=="init" and .current?.name==$ws) | true'

# subscribe to sway workspace events
#   filter through jq and block until output is read
#     on output, the workspace/init event was received for <workspace_name>
#       on workspace/init, swaymsg -- <message>
swaymsg -t subscribe -m '["workspace"]' |
  jq --unbuffered --arg ws "$ws" "$filter" |
  {
    while read; do
      swaymsg -- "$@"
    done
  }

