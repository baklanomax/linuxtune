# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

PROMPT_COMMAND="history -a; history -n"
/usr/sbin/kbdrate -r 2.0 -d 1000 &> /dev/null
alias mc='mc -u'

case $(tty) in
	/dev/tty3)
		setterm --background blue --foreground green --store --clear=rest
		;;
	/dev/tty4)
		setterm --background blue --foreground green --store --clear=rest
		;;
	/dev/tty5)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty6)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty7)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty8)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty9)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty10)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty11)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty12)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;
	/dev/tty13)
		setterm --background cyan --foreground yellow --bold on --store --clear=rest
		;;	
	/dev/tty14)
		setterm --foreground magenta --store --clear=rest
		;;
	/dev/tty15)
		setterm --foreground magenta --store --clear=rest
		;;
	/dev/tty16)
		setterm --foreground magenta --store --clear=rest
		;;
	/dev/tty17)
		setterm --foreground magenta --store --clear=rest
		;;	
esac
