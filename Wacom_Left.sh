#!/bin/bash

#xsetwacom --list devices
#xrandr --listactivemonitors
#
#xsetwacom --set "[YourWacomDevice]" MapToOutput [your display]
#
#[YourWacomDevice] = device name or id:#
#
#for more information type, xsetwacom --help, /or/, man xsetwacom  

xsetwacom set "Wacom Intuos BT M Pen stylus" MapToOutput VGA-1
xsetwacom set "Wacom Intuos BT M Pen eraser" MapToOutput VGA-1
xsetwacom set "Wacom Intuos BT M Pen cursor" MapToOutput VGA-1
xsetwacom set "Wacom Intuos BT M Pad pad"    MapToOutput VGA-1

#https://askubuntu.com/questions/458460/wacom-tablet-middle-mouse-button-scrolling
xsetwacom set "Wacom Intuos BT M Pen stylus" Button 2 "pan"
xsetwacom set "Wacom Intuos BT M Pen stylus"  "PanScrollThreshold" 200

