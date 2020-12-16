#! /usr/bin/env fish

set -xg XDG_CURRENT_DESKTOP Unity
set -xg EDITOR /sbin/nvim
set -xg MANPAGER "nvim +Man!"
set -xg LC_COLLATE C
set -xg BEMENU_BACKEND wayland
set -xg MOZ_ENABLE_WAYLAND 1 
set -xg TERMINAL alacritty
set -xg NNN_PLUG 'f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;l:launch;p:preview-tui;b:-_|chromium $nnn;n:-_|/usr/bin/chromiumw $nnn;x:_chmod +x $nnn*'

ssh-add  ~/.ssh/id_inithost

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      set-next-bg -s northern-lights
    end
end
