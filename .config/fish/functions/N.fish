# Defined in - @ line 1
function N --wraps='sudo -E nnn -dH' --wraps='sudo -E nnn -dHC' --description 'alias N sudo -E nnn -dHC'
  sudo -E nnn -dHC $argv;
end
