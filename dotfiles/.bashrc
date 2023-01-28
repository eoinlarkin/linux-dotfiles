#
# ~/.bashrc
#

# disabling this as causing issues with compatability
# export XDG_CONFIG_HOME='${HOME}/.config'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# running sway with logging
# alias sway="sway --verbose > /var/log/sway.log 2>&1"
