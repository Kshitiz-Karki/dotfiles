# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway

# User specific environment and startup programs
