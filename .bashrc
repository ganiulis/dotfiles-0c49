# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples.

# Don't do anything if not running interactively:
case $- in
*i*) ;;
*) return ;;
esac

# Source configuration files inside `~/.bashrc.d` directory:
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*.sh; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
	unset rc
fi
