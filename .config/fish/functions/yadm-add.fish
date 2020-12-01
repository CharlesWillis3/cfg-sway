# Defined in - @ line 1
function yadm-add --wraps='yadm add --pathspec-from-file=~/.config/yadm/pathspec' --wraps='pushd ~;yadm add --pathspec-from-file=~/.config/yadm/pathspec; popd' --wraps='pushd ~;yadm add --pathspec-from-file=.config/yadm/pathspec; popd' --wraps=pushd\ \~\;yadm\ add\ --pathspec-from-file=\'.config/yadm/pathspec\'\;\ popd --wraps=pushd\ \~\;\ yadm\ add\ --pathspec-from-file=\'.config/yadm/pathspec\'\;\ popd --description alias\ yadm-add\ pushd\ \~\;\ yadm\ add\ --pathspec-from-file=\'.config/yadm/pathspec\'\;\ popd
  pushd ~; yadm add --pathspec-from-file='.config/yadm/pathspec'; popd $argv;
end
