ps1derful_get_git_last_commit() {
	local user_name=$1
	user_name="${user_name:-`git config user.name`}"

    local last_commit=`git log --author="$user_name" --pretty=format:%cr -1 2>/dev/null`
    
    if [ $? -ne 0 ]; then
        exit 1
    fi

    if [ -z "$last_commit" ]; then
        last_commit="never"
    fi

    echo $last_commit
}

ps1derful_get_git_sha() {
    git rev-parse --short HEAD 2>/dev/null
}

ps1derful_get_git_change_count() {
    git status --p 2>/dev/null | wc -l | tr -d ' '
}