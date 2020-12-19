#!/bin/fish

function mntburn -a device -d "Mounts an encrypted device"
  set -l user (id -un)
  sudo cryptsetup open $device burn
  sudo mount /dev/mapper/burn $HOME/burn
  sudo chown $user $HOME/burn
end

