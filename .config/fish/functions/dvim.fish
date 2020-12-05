# Defined in - @ line 1
function dvim --wraps='vim -U dev.vim' --wraps='vim -u dev.vim' --wraps='vim -u ~/.config/nvim/dev.vim' --description 'alias dvim vim -u ~/.config/nvim/dev.vim'
  vim -u ~/.config/nvim/dev.vim $argv;
end
