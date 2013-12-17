PS1derful
=========

Intended to become a handy and flexible theme framework for bash prompts.

Why?
----
As a recovering Windows user, I'm quickly discovering the power and flexibility of Bash.  A friend of mine uses Zsh and was showing me some of the cool themes he has.  I wondered if I could recreate that theme in Bash for two reasons:

- To see if I could
- To learn more about bash and bash scripting

Using PS1derful
---------------
PS1derful should work with a few minor changes to your .bash_profile.

### __git_ps1

PS1derful uses __git_ps1 from [.git-prompt.sh](https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh).  You can curl it:

```sh
curl -o ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
```

Here's how I like to configure the __git_ps1 options:

```sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="verbose git"
```

In addition to .git-prompt.sh, you need to source one of the templates . . . at the time of writing there's only one (but we'll work on that).  I'm referencing mine right from the github repo, but you'll probably want to put it somewhere clever like ~/.ps1derful

```sh
source ~/.git-prompt.sh
source ~/Documents/version_repositories/github/ps1derful/themes/default.sh
```

### Path Shortening
If you want to customize the way your path gets shortened, define a ps1derful_get_short_path method.  Mine shortens the home directory as well as the various places I keep version_repositories.

```sh
ps1derful_get_short_path() {
    local currentPath="$(PWD)"
    currentPath=`sed -E 's/(Documents\/)?version_repositories\/([^\/]+)/<\2>/' <<< $currentPath`
    currentPath="${currentPath/Documents\/version_repositories/<repos>}"
    currentPath="${currentPath/#$HOME/~}"
    echo $currentPath
}
```

### PROMPT_COMMAND
If you have a prompt that needs to update every time it gets loaded, setting PS1 alone won't do the trick.  Each theme should work simply by setting the PROMPT_COMMAND environment variable.

```sh
PROMPT_COMMAND="ps1derful_set_bash_prompt; $PROMPT_COMMAND"
```