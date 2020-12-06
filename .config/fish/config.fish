#! /usr/bin/env fish

set -xg XDG_CURRENT_DESKTOP Unity
set -xg EDITOR /sbin/nvim
set -xg MANPAGER "nvim +Man!"
set -xg LC_COLLATE C
set -xg BEMENU_BACKEND wayland

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      set-next-bg -s northern-lights
      exec sway
    end
end
