# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi='vim'
alias sudo='sudo '
alias op='xdg-open'
alias docker="sudo docker"
alias flake8='flake8 --ignore=E501'
alias watch='watch '

if [[ "x$SSH_CLIENT" != "x" ]]; then
    xdotool key --delay 100 ctrl+shift+n alt+Tilde l s Return e x i t Return
fi

alias wsync='watch -n 0.5 grep -e Dirty: -e Writeback: /proc/meminfo'

# I CANT TYPE
alias grpe='grep'
alias gre='grep'
alias greo='grep'
alias groe='grep'
