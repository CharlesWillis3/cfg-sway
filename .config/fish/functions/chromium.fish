# Defined in - @ line 1
function chromium --wraps='chromium --enable-features=UseOzonePlatform --ozone-platform=wayland' --wraps='/sbin/chromium --enable-features=UseOzonePlatform --ozone-platform=wayland' --description 'alias chromium /sbin/chromium --enable-features=UseOzonePlatform --ozone-platform=wayland'
  /sbin/chromium --enable-features=UseOzonePlatform --ozone-platform=wayland $argv;
end
