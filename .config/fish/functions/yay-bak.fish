# Defined in - @ line 1
function yay-bak --wraps='yay -Qqem > /home/cewillis3/.config/.bootstrap/pkg-foreign; yay -Qqen > /home/cewillis3/.config/.bootstrap/pkg-native' --description 'alias yay-bak yay -Qqem > /home/cewillis3/.config/.bootstrap/pkg-foreign; yay -Qqen > /home/cewillis3/.config/.bootstrap/pkg-native'
  yay -Qqem > /home/cewillis3/.config/.bootstrap/pkg-foreign; yay -Qqen > /home/cewillis3/.config/.bootstrap/pkg-native $argv;
end
