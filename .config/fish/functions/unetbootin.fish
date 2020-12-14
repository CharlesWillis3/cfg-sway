# Defined in - @ line 1
function unetbootin --wraps='xhost local:root && sudo QT_X11_NO_MITSHM=1 unetbootin' --description 'alias unetbootin xhost local:root && sudo QT_X11_NO_MITSHM=1 unetbootin'
  xhost local:root && sudo QT_X11_NO_MITSHM=1 unetbootin $argv;
end
