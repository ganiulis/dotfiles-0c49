function is_bin_in_path {
	builtin type -P "$1" &>/dev/null
}
