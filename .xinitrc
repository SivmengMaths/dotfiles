#!/bin/sh
# /etc/X11/xinit/xinitrc


# GTK application
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

sxhkd &
feh --bg-fill ~/Pictures/Wallpapers/sunset-1.jpg &
compton &
xrdb ~/.Xresources &


#while true; do
	#dwm >/dev/null 2>&1
#done

#exec dwm

exec i3
