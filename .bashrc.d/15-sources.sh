[[ -x "$HOME"/.local/bin/nvim ]] && export EDITOR=nvim

if [[ -x "$HOME/.nvm/nvm.sh" ]]; then
	export NVM_DIR="$HOME"/.nvm

	. "$NVM_DIR"/nvm.sh

	[[ -f "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion
fi

[[ -x "$HOME"/.local/bin/mise ]] && eval "$("$HOME"/.local/bin/mise activate bash)"
