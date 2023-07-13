#
# ~/.bashrc
#

# PATH
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Environment Variables
export MOZ_ENABLE_WAYLAND=1 # forcing firefox to run in wayland mode
export TERM=xterm-256color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# ****************************************************
# Microphone LED fix
# https://wiki.archlinux.org/title/Lenovo_ThinkPad_T14_(AMD)_Gen_3#Mute_Mic_LED_always_on
# ****************************************************

#if pactl list sources | grep -A 5 "Family 17h/19h HD Audio Controller Digital Microphone" | grep -q 'Mute: yes'; then
#  echo 1 | sudo tee /sys/class/leds/platform\:\:micmute/brightness
#else
#  echo 0 | sudo tee /sys/class/leds/platform\:\:micmute/brightness
#fi


# ****************************************************
# Aliases
# ****************************************************
alias ls='ls --color=auto'
alias sway="sway > /var/log/sway.log 2>&1"

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

# Updating the history in realtime
# https://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


# running sway with logging
# alias sway="sway --verbose > /var/log/sway.log 2>&1"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/eoin/google-cloud-sdk/path.bash.inc' ]; then . '/home/eoin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/eoin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/eoin/google-cloud-sdk/completion.bash.inc'; fi
