set -U __randbg_config $HOME/.config/randbg
set -xU RANDBG $__randbg_config/curr

function set-next-bg
  set -l options (fish_opt --short h --long help)
  set options $options (fish_opt --short=s --long=set --required-val)
  set options $options (fish_opt --short=b --long=basedir --optional-val --long-only)
  argparse $options -- $argv or return $status 
  
  set --query _flag_set; or return 2
  set --query _flag_basedir; or set --local _flag_basedir $HOME/.local/share/wallpapers
  
  set -U __randbg_basedir $_flag_basedir
  set -U __randbg_set $_flag_set
  set -U __randbg_target (random choice $__randbg_basedir/$__randbg_set/*.*)

  mkdir -p $__randbg_config

  rm -f $RANDBG
  ln -s $__randbg_target $RANDBG
end
