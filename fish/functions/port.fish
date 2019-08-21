# https://stackoverflow.com/a/30029855
function port -d "Find process that is listening to a port"
    lsof -iTCP -sTCP:LISTEN -n -P | grep "$argv[1]"
end
