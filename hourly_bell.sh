#!/bin/bash
#
# to contact use the reddit user -_-raj-_-

# if you dont have sox installed 
# type sudo apt-get install sox libsox-fmt-all


### the colon signifies that the value of that flag is needed.
### without a colon values on that flag is not needed. What does it mean? IDK. 
### But the program doesn't work right way without the colons. 
Default_File=/usr/share/sounds/gnome/default/alerts/glass.ogg	 ;
### System notification sound files are stored in /use/share/sound/ 
defaultMaxTime=0.5 ### This is just the default value. This value will be changed if given an input 
System_volume=$(python3 ~/.local/bin/volume.py);
echo System_volume=${System_volume};   
### to trim the music file use -->
### sox input.mp3 ouput.mp3 trim ofset_time_value length_to_trim
while getopts 'hf:v:s:m:L' opt; do
    case "${opt}" in 
    h ) echo -e " the flags r hf:v:s:m: stands for\\n \
		f for file. Default value is ~/Music/short-bells/light_trim.mp3\
	   	If u want to play random files from a directory \
  	  	then use this flag to input a directory location instead of a \
	  	file location, you may as well put a list of file-names using the \
	  	special characters like partialFileName\\*.mp3, but remember if you use \
	  	a special character use a '\' sign before it. \\n \
		v for Volume-factor as if the Master volume is 100%. \n \
		s for interval seconds, default value is 60. \\n \
        m for interval minnutes, default value is 1 and. \\n \
      	L for maximum time you want to play it in each interval.\
	   	Default value is 0.5 Sec. it plays the file for a random \ 
		duration bellow this maximum limit. if U don't want to randomize 
		that period simply chose a large maximum time to play and choose\
		a audio file whose length is bellow that limit. 	\\n \
		GOOD LUCK BEING IN THE PRESENT; "
	  exit ;;
    f ) FILEE=${OPTARG} ; 
		#ls ${FILEE};
		ls ${FILEE}>/dev/null 2>/dev/null;
        if [ ! $?  ]; then 
          echo "files not found taking default file" ;
          FILEE=${Default_File}
        fi   ;;
    v ) Volume=$(echo print\(${OPTARG}*\(100.0/${System_volume}\)\)|python3) 
      echo EffectiveVolume=$(echo print\(${Volume}*${System_volume}\)|python3);;
    s ) Sec=${OPTARG}    ;;
    m ) Min=${OPTARG} ;;
	L ) maxTime=${OPTARG} ;;
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
maxTime="${maxTime:=${defaultMaxTime}}"
echo $maxTime ;

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
		shufledFileName=$(ls $FILEE | shuf -n 1); 
		echo $shufledFileName 
		length=$(sox --info -D ${shufledFileName} ); 
### this comand stores the length of audio in seconds
		#TF= $(echo print ${maxTime}\<${length} > python )
		TF=$( echo ${maxTime}'<'${length} | bc -l )
		if [ ${TF} -eq 1 ] ; then 
			startTime=$(echo print \(${length}-${maxTime}\)\*\($RANDOM/32768.0\) | python );
		else
			startTime=0;
		fi	
### $RANDOM is a random number between 32767
### if maxTime is less than the audio length then a random time between 0 to length-maxTime is chosen as startTime
		nohup play --volume $Volume ${shufledFileName} trim ${startTime} ${maxTime}  > /dev/null 2>/dev/null
### The > /dev/null and 2> directs the output error to null.  
		fi 
			echo $spend	
			sleep 1s 
### comment without this sleep line the music will go on being played 
### again and again untill the second is over
	fi	
	sleep 1s
done






























