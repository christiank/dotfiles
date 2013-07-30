#
# cfk's .bashrc
#

if [ ! -z $(which -a mixerctl) ] ; then
  # Turn off input from microphone next to webcam (Sony Vaio)
  # TODO This should be in some sort of script at boot, higher up
  mixerctl -n -w inputs.record2.mute=on

  # Turn off the system beep
  mixerctl -n -w inputs.beep2.mute=on
fi

# Locale
export LC_ALL="en_US.ISO8859-15"

# Color prompt
export PS1="\[\e[0;33m\]\u@\h:\w\[\e[0m\] "

# paths junk
PATH=${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R7/bin:/usr/pkg/bin
PATH=${PATH}:/usr/pkg/sbin:/usr/games:/usr/local/bin:/usr/local/sbin
PATH=${PATH}:/usr/local/heroku/bin
#PATH=${PATH}:/tmp/avn/bin

MANPATH=/usr/share/man:/usr/X11R7/man:/usr/local/share/man:/usr/local/man:/usr/pkg/man

#MANPATH=${MANPATH}:/tmp/avn/man

#PKG_PATH=ftp://ftp.netbsd.org/pub/pkgsrc/packages/NetBSD/i386/5.1_2011Q2/All

export PATH
export MANPATH
#export PKG_PATH

# Favorites
export EDITOR=vim
export NETHACKOPTIONS=color,hilite_pet,lit_corridor,
export PAGER=less

export ACRONYMDB="/usr/share/misc/acronyms /usr/share/misc/acronyms.comp
/home/christian/docs/acronyms.cfkoch"

if [ -z "$DISPLAY" ]; then
  # Works best on NetBSD 6 if /etc/ttys specifies "vt220"
  # Not PERFECT w/in tmux....
  export TERM=wsvt25
else
  #export TERM=color_xterm
  #export TERM=rxvt-color # Since I'm using rxvt-unicode...
  export TERM=st
fi

# Collection of aliases
if [ ! -z $(which -a colorls) ]; then
  alias ls="colorls -G"
else
  alias ls="ls -G"
fi

alias la="ls -a"
alias ll="ls -l"
alias lis="ls | less"
alias dfhl="df -hl"

# Volume controls
if [ ! -z $(which -a mixerctl) ]; then
  alias vol="mixerctl outputs.master; mixerctl outputs.master2.mute"
  alias v+="mixerctl -w outputs.master++"
  alias v-="mixerctl -w outputs.master--"
  alias vmute="mixerctl -w outputs.master2.mute++" 

  function vset {
    mixerctl -w outputs.master=$1
  }
fi
