# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.




if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias          e='exit'
alias     Matlab='/usr/local/MATLAB/R2013a/bin/matlab'
alias BlackPearl='ssh -X sg13ip006@10.20.93.173'
alias    2ndhand='ssh -X sg13ip006@10.20.73.191'
alias    amgdskp='ssh -X student3@10.20.92.240'
alias    amgdskp-sftp='sftp student3@10.20.92.240'
alias Dv='dirs -v'
alias hhh='hostname'
alias cdgvfs='cd /run/user/1000/gvfs/'
#alias source-change='sudo mv /etc/apt/sources.list /etc/apt/sources.list.temporary;sudo mv /etc/apt/sources.list.bak /etc/apt/sources.list;sudo mv /etc/apt/sources.list.temporary /etc/apt/sources.list.bak;'
alias Sspnd='sudo /usr/sbin/pm-suspend'
alias Matlab='/usr/local/MATLAB/R2016a/bin/matlab &'
alias Setproxy_serb='export {http,https,ftp}_proxy="http://2015h_abdo:hindhaymanthabet@196.1.114.80:2222/"'
alias Unset_proxy='unset {http,https,ftp}_proxy'
alias dipa='ssh -X sourajghosh@10.20.92.238' 
alias Soumenda='ssh -X sg13ip006@10.20.93.69'
alias Amg='ssh -X student1@10.20.73.185'
alias cluster='ssh -X sg13ip006@10.0.30.1'
alias Cluster='sftp sg13ip006@10.0.30.1'
alias Amg4='ssh -X anandamohan@10.0.51.204'
alias Amg5='ssh -X anandamohan@10.0.51.205'
alias Amg6='ssh -X anandamohan@10.0.51.206'
alias Amg7='ssh -X anandamohan@10.0.51.207'
#alias Android_Studio= ' ~/TECH/Android/android-studio/bin/studio.sh'	  
alias Vol='echo $(python3 ~/.local/bin/volume.py)' 
alias ttt='tmux attach -t $1 || tmux new -s $1' 
#alias trash='mv $1 ~/.local/share/Trash/files/$1'
#alias SwapEsc='setxkbmap -option caps:swapescape' 
alias delTmuxHistory='rm ~/.tmux/resurrect/tmux_resurrect_*T*.txt; rm ~/.tmux/resurrect/last '
alias Day="echo `date +%F`___`date +%W`"       
alias MenuEscape="xmodmap -e 'keycode 135 = Escape' "


function Swap(){ setxkbmap -option ctrl:nocaps; setxkbmap -option shift:both_capslock_cancel; setxkbmap -option numpad:mac; setxkbmap -option keypad:pointerkeys; xmodmap -e 'keycode 135 = Escape' ; xkbset ma 50 20 20 30 300 ; }

function trash() { 
	for i in $@
	do
		mv -t ~/.local/share/Trash/files $i;
	done
}

TRASH=~/.local/share/Trash/files/




