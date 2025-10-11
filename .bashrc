# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples.

# Don't do anything if not running interactively:
case $- in
*i*) ;;
*) return ;;
esac

if [ -d "$HOME/.bashrc.d" ]; then
	for rc in "$HOME"/.bashrc.d/*.sh; do
		[ -f "$rc" ] && . "$rc"
	done

	unset rc
fi
