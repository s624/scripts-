#!/bin/bash

key="org.gnome.desktop.a11y.keyboard mousekeys-enable"
current=$(gsettings get $key)

if [ "$current" == "true" ]; then 
	gsettings set $key false
else
	gsettings set $key true
fi

