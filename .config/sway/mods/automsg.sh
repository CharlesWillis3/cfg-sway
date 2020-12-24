#!/usr/bin/env bash

#####################
# setup trace logging
#   this section can be safely removed
#
if [ $1 = "trace" ]; then
  shift
  # file descriptor to use for the log file
  XFD=55
  # log filename
  XFN=~/automsg_$1_$(md5sum<<<$* | cut -c 1-8).trace

  eval "exec $XFD>>$XFN"
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

# parse events
#
events=(${1//:/ }); shift
delim=""
for e in "${events[@]}"; do
  subscribe+="$delim\"$e\""
  delim=" ,"
done
subscribe="[${subscribe}, \"workspace\"]"

# parse select filter
#
select=$1; shift
# the filter will only output when the select matches
filter='if .change=="reload" then .change else . | select('"$select"') | "match" end'

# parse msg
#
if [ "$1" = "--" ]; then
  shift
else
  echo "msg must be passed after --"
  exit 1
fi

# subscribe to sway workspace events
#   filter through jq and block until output is read
while read -r result; do
  [ $result = '"reload"' ] && break
  [ $result = '"match"' ] && swaymsg -- "$@"
done < <(swaymsg -t subscribe -m "$subscribe" |
  jq --unbuffered "$filter")
echo exiting

