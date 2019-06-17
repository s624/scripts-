#!/bin/bash 


# /bin/bash -c "Chromium Web Browser" & 
# /bin/bash -c "qpdfview" & 
# /bin/bash -c "firefox" & 


##----some usefull commands-------
# for i in `xdotool search --name "chromium"`; do xdotool getwindowname $i; done
# for i in `xdotool search --name "chromium"`; do name=`xdotool getwindowname \$i` ; echo $i $name;    done



#--opening--qpdfview----
xdotool key  --clearmodifier  super; 
sleep 1  ;
xdotool  type --clearmodifier  qpdfview;
sleep 1  ;
xdotool key --clearmodifier   Return;
sleep 1   ;
xdotool key --clearmodifier super+shift+braceright;
sleep 1   ;
#xdotool key  --clearmodifier alt+shift+m;
#sleep 1   ;
#xdotool key  --clearmodifier alt+shift+t;
#sleep 1   ;
xdotool key  --clearmodifier super+f;
sleep 1   ;

#----chromium-----
xdotool key  --clearmodifier  super; 
sleep 1   ;
xdotool type  --clearmodifier  chromium;
sleep 1   ;
xdotool key  --clearmodifier  Return;
sleep 2   ;
xdotool key  --clearmodifier  super+h;
sleep 1   ;
xdotool key  --clearmodifier  Tab;
sleep 1   ;
xdotool key  --clearmodifier  Return;
sleep 1   ;

#----firefox------
xdotool key   --clearmodifier  super
sleep 1   
xdotool type  --clearmodifier  firefox
sleep 1   
xdotool key   --clearmodifier  Return
sleep 1   
xdotool key   --clearmodifier  super+Shift+j  # its not working for some reason
sleep 1   
xdotool key   --clearmodifier  r
sleep 1   
xdotool key   --clearmodifier  super+k   # so its not working either. 
sleep 1   


#-----Tmux-----
xdotool key  --clearmodifier  super+shift+t
sleep 1   
xdotool getactivewindow key  --clearmodifier  super+l
sleep 1   

xdotool type --clearmodifier MyScript.sh 
sleep 1   
xdotool key --clearmodifier Return
sleep 1   
xdotool type --clearmodifier xcapeKeys.sh 
sleep 1   
xdotool key --clearmodifier Return
sleep 1   

xdotool type  --clearmodifier  tmux
sleep 1   
xdotool key   --clearmodifier   Return
sleep 1   
xdotool getactivewindow key  --clearmodifier   ctrl+a
sleep 1   
xdotool getactivewindow key  --clearmodifier   ctrl+r
sleep 1   













