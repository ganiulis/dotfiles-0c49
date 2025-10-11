# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# Includes Bash configuration files when Bash is running
if [ -n "$BASH_VERSION" ]; then
	[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi
