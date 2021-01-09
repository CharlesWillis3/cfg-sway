#!/usr/bin/env bash

# usage: ./autows.sh <gt> <lt> [-- <exec>]

[ "$3" != "--"  ] && read -r exec

autonum=$(swaymsg -t get_workspaces -r | jq "[.[].num] | map(select(. < ${2})) | [max + 1, ${1}] | max")

if [ -z "$exec" ]; then
  shift; shift; shift
  exec="$*"
fi

swaymsg workspace number "$autonum"
swaymsg exec -- "$exec"
