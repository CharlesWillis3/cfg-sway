#!/usr/bin/env bash

# selectevt for swaywm, by n7ewx
# 
# usage: ./selectevt.sh [single] (<event> | %) '<jq select filter>'
# 
# subscribe to the sway <event> and filter events
#   using the <jq select filter>. 
#
# a sway config reload will always stop the script
#   which will output 'reload' then exit with code $EX_RELOAD
#

# exit codes
#
EX_SINGLE=0
EX_ERROR=1
EX_RELOAD=2
EX_SHUTDOWN=3

pipe="$(mktemp -u)"
mkfifo $pipe
trap "rm -f $pipe" EXIT

# check for single mode
#
[ "$1" = "single" ] && single=true && shift

# always subscribe to workspace events for the 'reload' change
# and shutdown for the shutdown event
subscribe="[\"workspace\", \"shutdown\"]"

# a '%' as the <event> indicates to just use the default events
if [ "$1" != "%" ]; then
  subscribe="[\"${1}\", \"workspace\", \"shutdown\"]"
fi

# start swaymsg
#
swaymsg -t subscribe -m "$subscribe" > $pipe &
spid=$!
trap 'rv=$?; kill -0 $spid &>/dev/null && kill $spid; rm -f $pipe; exit $rv' EXIT
trap 'exit $EX_ERROR' USR1

# setup select filter
#
select=$2
# the filter will only output on a match, reload or swaymsg error
filter='if .change=="reload" then 
          .change
        elif .change=="exit" then
          "shutdown"
        elif .success==false then
          "swaymsg-error"
        else
          . | select('"$select"') | "match" 
        end'

# subscribe to sway events
#   filter through jq and block until output is read
#   in standard and single modes, exits on a sway config reload with $EX_RELOAD
#   in single mode, exits on the first filter match with $EX_SINGLE
while read -r result; do
  if [ "$result"  = "swaymsg-error" ];then
    echo "swaymsg error: check the <event> parameter"
    exit $EX_ERROR
  fi
  
  [ "$result" = "shutdown" ] && exit $EX_SHUTDOWN
  [ "$result" = "reload" ] && exit $EX_RELOAD
  [ $single ] && exit $EX_SINGLE
  echo $result
done < <(
  trap 'kill -SIGUSR1 $$' ERR
  jq --unbuffered --raw-output "$filter" < $pipe
)
