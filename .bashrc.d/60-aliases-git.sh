if is_bin_in_path git; then
	alias g=git
	alias gst='g status'
	alias gca='g add . && g commit -m'
	alias gpsh='g push'
	alias gpl='g pull'
	alias gw='g worktree'

	# Dotfiles
	alias dtf='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
	alias dtfst='dtf status'
	alias dtfaa='dtf add .'
	alias dtfcm='dtf commit -m'
	alias dtfpsh='dtf push'
	alias dtfpl='dtf pull'
	alias dtfst='dtf status'
fi
