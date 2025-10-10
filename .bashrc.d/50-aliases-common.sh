# Basic commands
alias c=cd
alias cl=clear
alias b=exit
alias s=sudo

# Directory and file management
alias l='ls -F'
alias la='ls -aF'
alias ll='ls -lF'
alias lla='ls -alF'

# Add an "alert" alias for long running commands; use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
