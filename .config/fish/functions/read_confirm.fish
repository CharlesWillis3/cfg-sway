function read_confirm -a prompt 
  read -l -P "$prompt [Y/n]: " confirm
  switch $confirm
    case Y y ''
      return 0
    case N n
      return 1
  end
end
