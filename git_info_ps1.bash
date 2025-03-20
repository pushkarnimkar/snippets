_PS1_TITLE="\[\e]0;\u@\h: \w\a\]";
_PS_DATETIME="\[\e[0;90m\][\D{%Y-%m-%d %H:%M:%S}]\[\e[00m\]";
_PS1_CLASSIC="\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\] \w\[\e[00m\]";
_PS1_GIT="";

# Function to get git information
update_prompt() {
    # Check if current directory is a git repository
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        # Get current branch name
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null);

        # Check if repo is dirty (has uncommitted changes)
        local dirty="\[\e[01;36m\]✓\[\e[00m\]"
        if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
            dirty="\[\e[01;31m\]✗\[\e[00m\]" # Mark as dirty with an asterisk;
        fi

        _PS1_GIT="\[\e[01;94m\]($branch)\[\e[00m\] $dirty ";
    else 
        _PS1_GIT="$ ";
    fi

    PS1="$_PS1_TITLE\n$_PS_DATETIME $_PS1_CLASSIC\n $_PS1_GIT"
}

export PROMPT_COMMAND=update_prompt; 

