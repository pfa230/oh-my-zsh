# Thanks to Steve Losh: http://stevelosh.com/blog/2009/03/candy-colored-terminal/

last_command_status="%{$fg[red]%}%(?..[%?%1v] )%{$reset_color%}"

# The prompt
PROMPT='|--  %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[cyan]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info) --|
$last_command_status%(!.#.$) ' 

# The right-hand prompt
RPROMPT='${time} $(mac_battery_charge)'

# local time, color coded by last return code
time="%{$fg[green]%}%*%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function mac_battery_charge {
    color_green="%{$fg[green]%}"
    color_yellow="%{$fg_bold[yellow]%}"
    color_red="%{$fg[red]%}"
    color_reset="%{$reset_color%}"
	
	max_capacity=`ioreg -rc AppleSmartBattery | grep MaxCapacity | awk {'print $3'}`.0
	current_capacity=`ioreg -rc AppleSmartBattery | grep CurrentCapacity | awk {'print $3'}`.0
	((normalized_charge = 10 * $current_capacity / $max_capacity))
	charge_threshold=`printf "%.0f" $normalized_charge`

	if [ $charge_threshold -ge 6 ]; then
	 	color=$color_green
	else
		if [ $charge_threshold -ge 4 ]; then
	 		color=$color_yellow
		else
	 		color=$color_red
		fi
	fi
	triangles=""

	for ((i = 0; i < $charge_threshold; i++)); do triangles="${triangles}▸"; done
	for ((i = $charge_threshold; i < 10; i++)); do triangles="${triangles}▹"; done

	echo "$color $triangles $color_reset"
}
