#!/bin/bash
sudo tlp start # if you want to srart tlp in when in battery use true instead of start
if  [ `sudo prime-select query`=='intel' ] # | grep -Fxq 'intel' 
then
	sudo prime-select intel
else
	sudo prime-select intel
	echo intel card is selected;
fi

