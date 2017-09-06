## Usage: brew bundle dump; brew leaves | awk -f brewstrainer.awk - Brewfile
## Adapted from https://github.com/Homebrew/homebrew-bundle/issues/236#issuecomment-264279806

# read file1 (stdin via - in usage above) into an array
FNR == NR {
    leaves["\"" $1 "\""] = ""
    next
}

# skip lines that begin with brew but weren't in file1
$1 == "brew" {
    if (! ($2 in leaves))
        next
}

# print everything that's left
{
    print $0
}
