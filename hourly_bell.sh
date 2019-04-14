#!/bin/bash

#
# to contact use the reddit user -_-raj-_-
#

# if you dont have sox installed 
# type sudo apt-get install sox libsox-fmt-all


if [ "$1" == "-h" ]; then
	echo " 1st argument should be the path to the file which would be played \n 2nd argument should be the volume factor"
	exit
fi	

while true; do
	if [ $(date +%S) -eq 0 ] ; then 
		let min=$(date +%M)
		if [ "$(date +%M)" -ne 59 ] && [ "$(date +%M)" -ne 10  ] && [ "$(date +%M)" -ne 20 ] && [ "$(date +%M)" -ne 30 ] && [ "$(date +%M)" -ne 40 ] && [ "$(date +%M)" -ne 49 ] && [ "$(date +%M)" -ne 00 ]  ;  then 
			if [ $# -gt 1 ] ; then
				play --volume $2  $1 
			else
				play $1
			fi	
			sleep 1s #comment without this line the music will go on being played again and again untill the second is over
		fi	
	#else
	#	echo 'not round'	
	fi
done



