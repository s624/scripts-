#!/bin/bash

### To get the most out of this script make a shortcut in your 
### keyboard, the shortcut wont open a new vim window by itself
### you have to mention that. So make the custom command like the 
### following
### gnome-terminal -e 'sh -c "log.sh"'


cd /home/sg13ip006/MEGA/Diary/2019/Log



if [ -f `date +%F` ]; then 
	echo `date` ' -- ' >> `date +%F` 
	vim  '+ normal G A' +startinsert!  `date +%F` 
else
	touch `date +%F`
	echo `date` >> `date +%F ` 
	vim  '+ normal G A' +startinsert!  `date +%F` 
fi

# the exclamation mark with +startinsert starts the append mode. 
# I don't know why 'A' is not appending at the end of the line, but
# its putting the cursor at the end of the line. 



