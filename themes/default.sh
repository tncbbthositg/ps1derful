__theme_source_dirname=`dirname $BASH_SOURCE`

source $__theme_source_dirname/../git_helpers.sh
source $__theme_source_dirname/../bash_colors.sh
source $__theme_source_dirname/../binary_clock.sh
source $__theme_source_dirname/../ps1derful_helpers.sh

ps1derful_set_bash_prompt(){
    local b="$light_gray"
    local path=`__ps1derful_get_short_path`

    local user_name=$GIT_AUTHOR_NAME
  	if [ -z $user_name ]; then
        local user_name="${user_name:-`git config user.name`}"
    fi

    local last_commit_time=`ps1derful_get_git_last_commit "$user_name"`
    local changed_file_count=`ps1derful_get_git_change_count`

    local git_prompt=`__git_ps1 " { %s | Δ $changed_file_count | $last_commit_time | $user_name }"`

    local clock=`binary_clock_get_time`

    PS1="\n\[$b\]╭─┤ \! ├──┤ $i_green$clock\[$b\] ├──┤ $blue\u@\h\[$b\] ├─╼  $yellow$path\[$b\]$git_prompt\[$b\]\n╰─╼ $white\$ "
}
