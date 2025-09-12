function gcd --wraps cd --description 'cd into the root of the current git repo or superproject'
    # Prefer superproject root if we’re in a submodule work tree
    set rootdir (git rev-parse --show-superproject-working-tree 2>/dev/null)
    or set rootdir (git rev-parse --show-toplevel 2>/dev/null)

    # If we’re *inside* a .git dir (e.g. .git or .git/modules/…): derive root from the gitdir path
    if test -z "$rootdir"
        set gitdir (git rev-parse --absolute-git-dir 2>/dev/null)
        if test -n "$gitdir"
            # Strip "/.git" and anything after it, including "/.git/modules/…"
            set rootdir (string replace -r '/\.git(?:/.*)?$' '' -- $gitdir)
        end
    end

    if test -n "$rootdir"
        cd $rootdir
    else
        echo "Not in a git work tree"
        return 1
    end
end
