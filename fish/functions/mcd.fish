# https://stackoverflow.com/a/30029855
function mcd -d "Create directory and navigate to it"
  mkdir -p "$argv[1]" && cd "$argv[1]"
end
