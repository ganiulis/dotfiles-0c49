if [[ -x "$HOME/.nvm/nvm.sh" ]]; then
	export NVM_DIR="$HOME/.nvm"

	. "$NVM_DIR/nvm.sh"

	if [[ -f "$NVM_DIR/bash_completion" ]]; then
		. "$NVM_DIR/bash_completion"
	fi
fi

[[ -x "$HOME/.local/bin/mise" ]] && eval "$("$HOME"/.local/bin/mise activate bash)"
