#!/usr/bin/python
from gtts import gTTS
import os, time, argparse
import subprocess as sb


parser=argparse.ArgumentParser();
parser.add_argument("-l","--lang", help="put the language name here", default='en', type=str )
parser.add_argument("--verbosity", choices=[0,1], default=1)
parser.add_argument("-v","--volume", default=1, type=int)
args=parser.parse_args()
Args=vars(args); # it converts namespace into a dictionary

Lang=str(Args['lang'])
verbosity=int(Args['verbosity'])
Volume=int(Args['volume'])

print("Lang=%s"%Lang)
print("Volume=%d"%Volume)

if(os.path.isdir("/home/sg13ip006/Music/gTTS/%s"%(str(Lang)))):
    pass
else:
    os.mkdir("/home/sg13ip006/Music/gTTS/%s"%(Lang))
    for i in range(60):
        Not=gTTS(text=str(i),lang=Lang, slow=False)
        Not.save("/home/sg13ip006/Music/gTTS/%s/%s.mp3"%(Lang,str(i)))
        print(i)

Count=0;
while True:
    secondsNow=int(sb.check_output(["date", "+%S"]  ).decode().strip()) ; #print(secondsNow) ;
    minutesNow=int(sb.check_output(["date", "+%M"]  ).decode().strip()) ; #print(minutesNow) ;
    if (secondsNow==0 and minutesNow not in [59,10,20,30,40,49]):
        print('Count '+str(Count))
        os.system("play -v %d %s >/dev/null 2>/dev/null "%(Volume,"/home/sg13ip006/Music/gTTS/"+str(Lang)+'/'+str(minutesNow)+".mp3") )
        Count=Count+1;  
        time.sleep(1)












