#!/bin/fish

function umntburn -d "Unmounts an encrypted device"
  sudo umount $HOME/burn
  sudo cryptsetup close burn
end
