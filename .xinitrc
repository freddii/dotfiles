#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)


#sleep 10 && /home/xxUserxx/switch_background.sh &
#
#disable beep in xfce when deleting files:
xset b off


# invoke global X session script
. /etc/X11/Xsession
xbindkeys &
