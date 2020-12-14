# Defined in - @ line 1
function sysyadm --wraps='sudo yadm -Y /etc/yadm' --wraps='sudo -E yadm -Y /etc/yadm' --description 'alias sysyadm=sudo -E yadm -Y /etc/yadm'
  sudo -E yadm -Y /etc/yadm $argv;
end
