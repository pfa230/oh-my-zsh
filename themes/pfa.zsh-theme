# Thanks to Steve Losh: http://stevelosh.com/blog/2009/03/candy-colored-terminal/

BAT_CHARGE=$ZSH/lib/batcharge.py

# The prompt
PROMPT='|--  %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info) --|
%(!.#.$) ' 

# The right-hand prompt
RPROMPT='${time} $(battery_charge)'

# Add this at the start of RPROMPT to include rvm info showing ruby-version@gemset-name
# %{$fg[yellow]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%} 

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

