#!/usr/bin/fish
 

set -l menu lock suspend reboot shutdown exit uefi
set -l cmd (string split " " $menu | bemenu -l (count $menu) $argv) 

switch $cmd
case lock
  swaylock -f -i ~/.config/randbg/curr
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
