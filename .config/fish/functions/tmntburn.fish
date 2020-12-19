#!/bin/fish

function tmntburn -a device -d "Toggles mount of encrypted device"
  if sudo cryptsetup status burn > /dev/null
    umntburn
  else
    mntburn $device
  end
end
