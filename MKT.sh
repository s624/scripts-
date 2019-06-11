#!/bin/bash

key="org.gnome.desktop.a11y.keyboard mousekeys-enable"
current=$(gsettings get $key)

if [ "$current" == "true" ]; then 
	gsettings set $key false
else
	gsettings set $key true
fi


xkbset ma 50 20 20 30 300

