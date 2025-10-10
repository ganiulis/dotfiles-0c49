if is_bin_in_path nvim; then
	alias v=nvim
elif is_bin_in_path vim; then
	alias v=vim
fi

if is_bin_in_path make; then
	alias m=make
fi

if is_bin_in_path docker; then
	alias d=docker
	alias dc='d compose'
fi

if is_bin_in_path kubectl; then
	alias k=kubectl
	alias kg='k get'
	alias kd='k describe'
fi
