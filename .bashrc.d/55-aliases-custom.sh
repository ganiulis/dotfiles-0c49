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
	alias dc="docker compose"
fi

if is_bin_in_path kubectl; then
	alias k=kubectl
	alias kg="kubectl get"
	alias kd="kubectl describe"
fi
