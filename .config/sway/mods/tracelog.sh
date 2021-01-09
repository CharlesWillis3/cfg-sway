#!/usr/bin/env bash

# usage: ./tracelog.sh <fd> <fname> -- <script>

fd="$1"; shift
fp="$1"; shift
fn="${fp}_$(md5sum<<<$* | cut -c 1-8).trace"; 

eval "exec $fd>>$fn"
BASH_XTRACEFD=$fd
exec 1>&$BASH_XTRACEFD 2>&$BASH_XTRACEFD
echo
echo ====="$(date)"=====
echo $@
set -x

shift
source "$@"
