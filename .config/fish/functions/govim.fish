# Defined in - @ line 1
function govim --wraps='vim -u /home/cewillis3/.config/go.vim' --wraps='vim -u /home/cewillis3/.config/nvim/go.vim' --description 'alias govim vim -u /home/cewillis3/.config/nvim/go.vim'
  vim -u /home/cewillis3/.config/nvim/go.vim $argv;
end
