#MY BASHRC file

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups
export HISTFILESIZE=1000000
export HISTSIZE=100000
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

export color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot::+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot::+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot::+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
export PATH=$PATH:/home/serendio/Adobe_Flex_Builder_Linux/Player/linux
export ENGINE_FOLDER_ROOT=/home/serendio/.cedega/.winex_ver
export BT_BUILD=ia32-glibc25-gcc42
export EDITOR=emacs
export CC=/usr/bin/g++
TERM=xterm
export TERM

export GREP_COLOR=33

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#--------------------------------------------------
#    Extracts most files, mostly
#--------------------------------------------------
extract () {

  if [ -f $1 ] ; then

    case $1 in

      *.tar.bz2)  tar xjf $1    ;;

      *.tar.gz)   tar xzf $1    ;;

      *.bz2)      bunzip2 $1    ;;

      *.rar)      rar x $1      ;;

      *.gz)       gunzip $1     ;;

      *.tar)      tar xf $1     ;;

      *.tbz2)     tar xjf $1    ;;

      *.tgz)      tar xzf $1    ;;

      *.zip)      unzip $1      ;;

      *.Z)        uncompress $1 ;;

      *)          echo "'$1' cannot be extracted via extract()" ;;

    esac

  else

    echo "'$1' is not a valid file"

  fi

}

#Search for any word and get the associated wiki text.
wiki () 
{ 
    dig +short txt $1.wp.dg.cx ;
}

#Concatenates multi-line args into one.
textcat() 
{
for i in "$*"; do echo $i;done;
}

#Given a command, check if man page exists otherwise check help.
man() 
{ 
/usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less) 
} 

#Quiet obvious.
ip2loc() 
{ 
    wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g'; 
         }

#Shortcut to create and cd in a new directory in one command.
mcd()
{
    test -d "$1" || mkdir "$1" && cd "$1"
}


alias lsa="ls -ltr"
alias psg="ps -ef|grep"
alias unrarb="unrar e -kb -o+"
export PYTHONSTARTUP=$HOME/.pythonrc.py
alias lkill="kill -9 $!"
alias addkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"
alias coeth="pkill -9 -f conky;sed -i s/wlan0/eth1/ /home/ashish/.conkyrc;conky -bqd"
alias cowlan="pkill -9 -f conky;sed -i s/eth1/wlan0/ /home/ashish/.conkyrc;conky -bqd"
alias py_compile="python -m py_compile"
alias aptins="sudo apt-get install"
alias aptsearch="apt-cache search"
alias fkill="pkill -9 -f"
alias fgrep="ps -ef| grep"
alias expand="cat ~/.bashrc| grep"
alias activate_virtualenv='source ~/devenv/bin/activate'
alias rmtrail='find . -maxdepth 3  -type f -name \*[~#]* -delete'
alias grep='grep --colour=always'
alias rgrep='rgrep --colour=always'
alias serve='python -m SimpleHTTPServer '
alias pgrep="pgrep -lf"
alias cdp="cd /home/ashish/Projects"

#List all files (including sub-directories) in size descending order.
alias du_sort="du -all|grep -v '/$'|sort -nr|less"
#Copy any text to console clipboard
alias xclip='xclip -selection c'
#make user aliases work with sudo
alias sudo='sudo ' 
