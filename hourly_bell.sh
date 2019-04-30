#!/bin/bash
#
# to contact use the reddit user -_-raj-_-

# if you dont have sox installed 
# type sudo apt-get install sox libsox-fmt-all


### the colon signifies that the value of that flag is needed.
### without a colon values on that flag is not needed. What does it mean? IDK. 
### But the program doesn't work right way without the colons. 
Default_File=~/Music/short-bells/light_trim.mp3
System_volume=$(python3 ~/.local/bin/volume.py)
### to trim the music file use -->
### sox input.mp3 ouput.mp3 trim ofset_time_value length_to_trim
while getopts 'hf:v:s:m:' opt; do
    case "${opt}" in 
    h ) echo " the flags r hf:v:s:m: stands for file Volume factor if \
      the Master volume is 100%  seconds and \
      minnutes, the default values of sec is 60 and min is 1 and music \
      is bracked " ; exit ;;
    f ) FILEE=${OPTARG} ; 
        if [ ! -f ${FILEE} ]; then 
          echo "file not found taking default file" ;
          FILEE=${Default_File}
        fi   ;;
      v ) let Volume=$(echo print\(${OPTARG}*\(100.0/${System_volume}\)\)|python3) ;;
    s ) Sec=${OPTARG}    ;;
    m ) Min=${OPTARG} ;;
    esac
  done 
### One extra space while puting a value in a variable and the variable is
### being treated like a command. 


### These are the default values of the flags 
if test -f ${Default_File} ; then
  FILEE="${FILEE:=${Default_File}}" 
else 
  echo "Default_File not found" 
fi
Volume="${Volume:=$(echo print\(100.0/${System_volume}\)|python3)}" 
Sec="${Sec:=60}"
Min="${Min:=1}"


let " spend=0 "
while true; do
  let m=$((10#$(date +%M))) ; 
  let ss=$((10#$(date +%S))); 
### These 10# before the value signifies that the 
### value is decimal without this syntax. The value 
### is being treated as octa and for numbers above 7 
### it gives an error. 
  if [ $((${ss}%${Sec})) -eq 0 ] && [ $((${m}%${Min})) -eq 0 ]  ; then 
		let "spend=spend+1"
		if [ "$m" -eq 59 ] && [ "$m" -eq 10  ] && [ "$m" -eq 20 ] && \
      [ "$m" -eq 30 ] && [ "$m" -eq 40 ] && [ "$m" -eq 49 ]  && \
      [ "$ss" -eq 0 ] ; then 
      true 
### true is a command that successfuly does nothing like pass statement in python. 
    else
			nohup play --volume $Volume  $FILEE > /dev/null 2>/dev/null
### The > /dev/null and 2> directs the output error to null.  
		fi 
			echo $spend	
			sleep 1s 
### comment without this sleep line the music will go on being played 
### again and again untill the second is over
	fi	
	sleep 1s
done




