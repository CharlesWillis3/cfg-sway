# Defined in - @ line 1
function yadm-add 
  pushd ~; yadm add --pathspec-from-file='.config/yadm/pathspec'; popd $argv;
end
