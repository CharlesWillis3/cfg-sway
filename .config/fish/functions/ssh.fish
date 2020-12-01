# Defined in - @ line 1
function ssh --wraps='TERM=xterm-256color /sbin/ssh' --description 'alias ssh TERM=xterm-256color /sbin/ssh'
  TERM=xterm-256color /sbin/ssh $argv;
end
