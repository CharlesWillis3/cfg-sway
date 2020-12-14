# Defined in - @ line 1
function fishsu --wraps='su -ms /bin/fish' --description 'alias fishsu su -ms /bin/fish'
  su -ms /bin/fish $argv;
end
