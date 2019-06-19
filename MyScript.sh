#!/bin/bash 




#setxkbmap -option ctrl:nocaps; #this replaces the caps lock key with the function of control
#setxkbmap -option shift:both_capslock_cancel; #this enables caps lock if both shifts are pressed together and disables it if any one of the shifts are pressed. 
setxkbmap -option shift:both_capslock; #this enables caps lock if both shifts are pressed together. 
#setxkbmap -option numpad:mac; # this makes the numlock always on 
setxkbmap -option keypad:pointerkeys; # this makes shift+numlock turn on the numpad mouse emulator. 

#this two lines I found from a reddit answer
#https://www.reddit.com/r/linux/comments/5h63js/anyway_to_remap_caps_lock_to_be_both_escape_and/dayc5m2?utm_source=share&utm_medium=web2
#these two lines set the caps as control modifier and as the escape button if pressed very quick with no other keys.
setxkbmap -option 'ctrl:swapcaps'      #  Swap Ctrl and Caps Lock
#xcape -e 'Control_L=Escape'; #this line should be executed in some other script dedicated for xcape only; because executing xcape command more than once just appends the keys instead of over writing them.  

#these 4 commands enables single press of shift_R, shift_L, Alt_R, Alt_L, to Delete, BackSpace, plus and asciitilde
#these 4 lines should be executed in some other script dedicated for xcape only; because executing xcape command more than once just appends the keys instead of over writing them.  
#xcape -e 'Shift_R=Delete' 
#xcape -e 'Shift_L=BackSpace' 
#xcape -e 'Alt_R=plus' 
#xcape -e 'Alt_L=asciitilde'






setxkbmap -option ctrl:menu_rctrl #this sets the menu key as right control key

#xmodmap -e 'keycode 135 = Escape';  # this uses xmodmap which is not so good. It makes the menu key escape key. 



xkbset ma 50 20 20 30 300 ; #this sets the sensitivity of the numpad mouse emulator, feel free to to check what suits you. 

xset r rate 250 33



exit 0


