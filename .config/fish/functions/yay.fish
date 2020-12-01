# Defined in - @ line 1
function yay --wraps='/sbin/yay --gpgflags "--keyserver keyserver.ubuntu.com"' --description 'alias yay /sbin/yay --gpgflags "--keyserver keyserver.ubuntu.com"'
  /sbin/yay --gpgflags "--keyserver keyserver.ubuntu.com" $argv;
end
