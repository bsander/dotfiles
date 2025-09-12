function .up

    pushd $DOTFILES; and make update
    popd

    echo Checking for software updates
    set -l update_output (softwareupdate --list --all 2>&1)

    if string match -q "*No new software available*" "$update_output"
        # echo "$update_output"
        echo No new software available.
        return 0
    end

    echo "Updating Todoist task (might require 1Password prompt)"
    set -l update_task 9038344840
    set -l todoist_apikey (op item get todoist --fields label='API key' --reveal)
    curl --request POST \
        --url https://api.todoist.com/rest/v2/tasks/$update_task \
        --header "Authorization: Bearer $todoist_apikey" \
        --header 'content-type: application/json' \
        --data '{
                "content": "MacOS Software Update",
                "description": "Before wrapping up today:\n\n```sudo softwareupdate --install --all```",
                "priority": 4,
                "due_string": "today 17:15"
            }' &>/dev/null

    echo Reopening Todoist task
    curl --request POST \
        --url https://api.todoist.com/rest/v2/tasks/$update_task/reopen \
        --header "Authorization: Bearer $todoist_apikey" \
        --header 'content-type: application/json' &>/dev/null
    echo Reopening Todoist task
    curl --request POST \
        --url https://api.todoist.com/rest/v2/tasks/$update_task/reopen \
        --header "Authorization: Bearer $todoist_apikey" \
        --header 'content-type: application/json'

    echo "Downloading update (might require 1password prompt)"
    op item get 'LAMS0159 Reaktor MBP3' --fields label='password' --reveal | softwareupdate --all --download --stdinpass
end
