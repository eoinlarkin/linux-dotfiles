#
# ~/.bashrc
#

export TERM=xterm-256color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Setting PS1
#PS1='\033[1;38;5;45m\][\u@\h \W]\$\033[00m\] '
#PS1='\[\033[1;38;5;99m\]\W λ\[\033[00m\] '
# https://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
PS1='\[\033[01;38;5;45m\]\u: \[\033[01;38;5;45m\]\W \[\033[01;38;5;45m\] \$ \[\033[0m\]'

# Bashrc Notes
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
all_colors() {
  for fgbg in 38 48 ; do # Foreground / Background
      for color in {0..255} ; do # Colors
          # Display the color
          printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
          # Display 6 colors per lines
          if [ $((($color + 1) % 6)) == 4 ] ; then
              echo # New line
          fi
      done
      echo # New line
  done
}


# running sway with logging
# alias sway="sway --verbose > /var/log/sway.log 2>&1"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/eoin/google-cloud-sdk/path.bash.inc' ]; then . '/home/eoin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/eoin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/eoin/google-cloud-sdk/completion.bash.inc'; fi
