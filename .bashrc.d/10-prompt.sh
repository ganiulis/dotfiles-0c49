# Enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
	if [[ -d "$HOME"/.dircolors ]]; then
		eval '$(dircolors -b "$HOME"/.dircolors)'
	else
		eval "$(dircolors -b)"
	fi

	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# Set colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

if [[ -x "$HOME/.local/bin/starship" ]]; then
	eval "$(starship init bash)"
else
	# Make sure to escape all non-printable characters otherwise multi-line inputs won't wrap correctly.
	# See https://askubuntu.com/questions/24358/how-do-i-get-long-command-lines-to-wrap-to-the-next-line.
	red="\[\e[31m\]"
	green_italic="\[\e[3;32m\]"
	yellow="\[\e[33m\]"
	white="\[\e[m\]"

	# Build the prompt
	prompt_time="\t"
	prompt_user="$red\u$white"
	prompt_dir="$green_italic\w$white"
	prompt_git=""

	if [[ -f /usr/lib/git-core/git-sh-prompt ]]; then
		. /usr/lib/git-core/git-sh-prompt
		prompt_git="$yellow\$(__git_ps1)$white"
	fi

	export PS1="$prompt_time $prompt_user $prompt_dir$prompt_git > "

	unset red
	unset green_italic
	unset yellow
	unset white
	unset prompt_time
	unset prompt_user
	unset prompt_dir
	unset prompt_git
fi
