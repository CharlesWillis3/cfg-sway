#!/usr/bin/env bash

# usage: ./winprogress.sh <app_id> -- <command> [<args>, ...]

pipe="/tmp/$(basename $0).$$.tmp"
trap "rm -f $pipe" EXIT
mkfifo $pipe

dirself=$(dirname $0)
app_id="$1" && shift

if [ "$1" != "--" ]; then 
  echo "<command> [<args>, ...] must be supplied after '--'"
  exit 1
fi

shift

if [ -z "$*" ]; then exit 2; fi

filter=".change==\"new\" and .container?.app_id==\"$app_id\""
text="launching $*"

# watch for a new window with <app_id>
source ${dirself}/selectevt.sh single window "$filter" > $pipe &

# start <command> in background and save pid
"$@" & disown
apid=$!

# SIGHUP is raised by zenity --auto-kill if cancel button is pressed
# kill the background pid
trap "kill -SIGKILL $apid" HUP

# show progress dialog until the new window with <app_id> is created
zenity --progress --text="$text" --pulsate --auto-kill --auto-close < $pipe
