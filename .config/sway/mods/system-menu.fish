#!/usr/bin/env fish

# usage: ./system-menu.sh dmenu lock-image dmenu-args
set fish_trace 1
set -l menu lock suspend reboot shutdown exit uefi
set -l cmd (string split " " $menu | $argv[1] -l (count $menu) $argv[3..-1]) 

switch $cmd
case lock
  swaylock -f -i $argv[2]
case suspend
  systemctl suspend
case reboot
  systemctl reboot
case shutdown
  systemctl poweroff -i
case exit
  swaymsg exit
case uefi
  systemctl reboot --firware-setup
end
