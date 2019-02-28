function c --description "Jump to a project."
    cd "$PROJECTS/$argv[1]"
end

function __fish_c
    ## TODO: Go deeper
    fd --search-path "$PROJECTS" --maxdepth 1 --type d -x echo "{/}/"
end

complete -f -c c -a "(__fish_complete_suffix (commandline -ct) / '' '$PROJECTS')"
# complete -f -c c -a "(__fish_c)"
# complete -f -c c -a '(__fish_complete_directories $PROJECTS/)'
