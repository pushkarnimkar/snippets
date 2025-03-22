_PS1_TITLE="\[\e]0;\u@\h: \w\a\]";
# _PS_DATETIME="\[\e[0;37m\][\D{%Y-%m-%d %H:%M:%S}]\[\e[00m\]";

_PS_DATETIME="\[\e[02m\][\D{%Y-%m-%d %H:%M:%S}]\[\e[00m\]";

_PS1_CLASSIC="\[\e[01;92m\]\u@\h\[\e[00m\]:\[\e[00;94m\] \w\[\e[00m\]";
_PS1_GIT="";

# Function to get git information
update_prompt() {
    # Check if current directory is a git repository
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        # Get current branch name
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null);

        # Check if repo is dirty (has uncommitted changes)
        local dirty="\[\e[01;92m\]✓\[\e[00m\]"
        if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
            # Mark as dirty with an asterisk;
            dirty="\[\e[01;91m\]✗\[\e[00m\]" 
        fi

        _PS1_GIT="\[\e[00;31m\]git:\[\e[00m\]\[\e[01;94m\]($branch)\[\e[00m\] $dirty ";
    else 
        emojis=('🧙' '🐣' '🤖' '☃️ ' '🎃' '🐰' '🚀' '🔥');
        # _PS1_GIT="\[\e[0;37m\]>>>\[\e[00m\] ${emojis[RANDOM % ${#emojis[@]}]} "
        _PS1_GIT="\[\e[00;31m\]>>> \[\e[00m\]${emojis[RANDOM % ${#emojis[@]}]} "
    fi

    PS1="$_PS1_TITLE\n$_PS_DATETIME $_PS1_CLASSIC\n$_PS1_GIT"
    }

export PROMPT_COMMAND=update_prompt; 

PS2="\[\e[00;31m\]> \[\e[00m\]";
PS4="\[\e[00;31m\]+ \[\e[00m\]";


