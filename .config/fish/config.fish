#! /usr/bin/env fish

set -xg XDG_CURRENT_DESKTOP Unity
set -xg EDITOR /sbin/nvim
set -xg MANPAGER "nvim +Man!"
set -xg LC_COLLATE C
set -xg BEMENU_BACKEND wayland
set -xg MOZ_ENABLE_WAYLAND 1 
set -xg QT_QPA_PLATFORM wayland
set -xg QT_QPA_PLATFORMTHEME qt5ct
set -xg TERMINAL alacritty
set -xg NNN_PLUG_BUILTIN 'f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;l:launch;p:preview-sway;s:suedit'
set -xg NNN_PLUG_OPENERS 'b:-_|chromium $nnn;n:-_|cnw $nnn'
set -xg NNN_PLUG "$NNN_PLUG_BUILTIN;$NNN_PLUG_OPENERS"
set -xg NNN_OPENER $HOME/.config/nnn/plugins/nuke
set -xg NNN_OPTS acdHnUx
set -xg GUI 1

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      set-next-bg -s northern-lights
      gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
    end
end
