# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Set colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

function init_bash_prompt() {
	# Make sure to escape all non-printable characters otherwise multi-line inputs won't wrap correctly.
	# See https://askubuntu.com/questions/24358/how-do-i-get-long-command-lines-to-wrap-to-the-next-line.
	local red="\[\e[31m\]"
	local green_italic="\[\e[3;32m\]"
	local yellow="\[\e[33m\]"
	local white="\[\e[m\]"

	# Build the prompt
	local prompt_time="\t"
	local prompt_user="$red\u$white"
	local prompt_dir="$green_italic\w$white"
	local prompt_git=""

	if [[ -f /usr/lib/git-core/git-sh-prompt ]]; then
		. /usr/lib/git-core/git-sh-prompt
		prompt_git="$yellow\$(__git_ps1)$white"
	fi

	export PS1="$prompt_time $prompt_user $prompt_dir$prompt_git > "
}

if [[ -x "$HOME/.local/bin/starship" ]]; then
	eval "$(starship init bash)"
else
	init_bash_prompt
fi

unset -f init_bash_prompt
