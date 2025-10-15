# Don't do anything if not running interactively:
case $- in
*i*) ;;
*) return ;;
esac

if [[ -d "$HOME"/.bashrc.d ]]; then
	for rc in "$HOME"/.bashrc.d/*.sh; do
		# shellcheck source=./.bashrc.d/01-path.sh
		[[ -f "$rc" ]] && . "$rc"
	done

	unset rc
fi
