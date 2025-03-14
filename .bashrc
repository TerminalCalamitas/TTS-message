# Only run for interactive shells.
case $- in
    *i*) ;;
      *) return;;
esac

# History settings.
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Define the constant message.
MESSAGE="Hey Doug, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore?"

# Enable colored prompt.
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[01;32m\]$MESSAGE@\[\033[01;32m\]$MESSAGE\[\033[00m\]:\[\033[01;34m\]$MESSAGE\[\033[00m\]\$ "
else
    PS1="$MESSAGE@$MESSAGE:$MESSAGE\$ "
fi

# Set the terminal window title to the constant message.
PROMPT_COMMAND="echo -ne \"\033]0;$MESSAGE\007\""

# Load bash completion if available.
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


