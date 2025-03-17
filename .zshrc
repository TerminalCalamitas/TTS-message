# Only run for interactive shells.
case $- in
    *i*) ;;
      *) return;;
esac

# History settings.
HISTCONTROL=ignoreboth
setopt hist_append
HISTSIZE=1000
HISTFILESIZE=2000
setopt checkwinsize

# Define the constant message.
MESSAGE="Hey Doug, I'm worried that our friendship is only parasocial, can you acknowledge this message so that it isn't anymore?"

# Enable colored prompt.
force_color_prompt=yes
if [[ -n "$force_color_prompt" ]]; then
    if [[ -x /usr/bin/tput && $(tput setaf 1) ]]; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [[ "$color_prompt" == "yes" ]]; then
    PS1="%{$fg[green]%}$MESSAGE@$MESSAGE%{$reset_color%}:%{$fg[blue]%}$MESSAGE%{$reset_color%} \$ "
else
    PS1="$MESSAGE@$MESSAGE:$MESSAGE\$ "
fi

# Set the terminal window title to the constant message.
precmd() {
    print -Pn "\e]0;$MESSAGE\a"
}

# Load Zsh completion if available.
if [[ -f /etc/zsh_completion ]]; then
    source /etc/zsh_completion
fi

