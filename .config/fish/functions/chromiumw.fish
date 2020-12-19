# Defined in - @ line 1
function chromiumw --wraps='chromium --new-window' --description 'alias chromiumw chromium --new-window'
  chromium --new-window $argv;
end
