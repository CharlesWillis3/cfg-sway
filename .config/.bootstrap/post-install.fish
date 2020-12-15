#!/bin/fish

set DIR (dirname (status --current-filename))
if read_confirm "enable ly dm service"
  sudo systemctl enable ly.service
  sudo systemctl disable getty@tty1.service
end

if read_confirm "enable spotifyd service"
  systemctl --user enable --now spotifyd.service
end

if read_confirm "enable rclone service"
  mkdir -p $HOME/drive
  rclone config reconnect drive:
  systemctl --user enable --now rclone@drive.service
end

if read_confirm "see todos"
  bat $DIR/todo.md
end
