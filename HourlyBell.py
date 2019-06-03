#!/usr/bin/env python3 
import numpy as np, subprocess as sb, sys, os, argparse, time;

SYSTEM_VOLUME=float(sb.check_output(['python3', '/home/sg13ip006/.local/bin/volume.py']).decode());
DEFAULT_MAX_TIME=0.5;
DEFAULT_FILE='/usr/share/sounds/gnome/default/alerts/*';

if( os.system("nohup ls %s >/dev/null 2>/dev/null"%DEFAULT_FILE)!=0  ):
    print("DEFAULT_FILE not found")
DEFAULT_SEC=60;

parser=argparse.ArgumentParser();
parser.add_argument("-f","--file"  ,help="put the filenames here if u use special characters like * then dont forget to use '\\' before them"   , default=DEFAULT_FILE, type=str   )
parser.add_argument("-v","--volume",help="put the volume factor here thinking as if system volume is 100", default=        1.0   , type=float )
parser.add_argument("--verbosity",help="put the level of verbosity here; choices are 0 1; default 1",default=1,type=int)
parser.add_argument("-s","--seconds",help="put the interval seconds",default=30,type=int);
parser.add_argument("-m","--minutes",help="put the interval minutes, default is 0",default=0,type=int);
parser.add_argument("-l","--maxLengthOfAudio",help="put the maximum length of your audio files that you want to play", default=0.5,type=float);
parser.add_argument("-r","--randomDistribution",help="put your random distribution type here 0:no randomness \t 1:normal distribution\t 2:unoform distribution",default=0,choices=[0,1,2],type=int);
parser.add_argument("--sigma",help="put the std of time intervals here",default=1e-10,type=float)

args=parser.parse_args()

Args=vars(args); # it converts the namespace into a dictionary

if( os.system("nohup ls %s >/dev/null 2>/dev/null"%Args['file'])!=0  ):
    print("musics files are not found");

FILELIST=sb.check_output(["bash","-c","ls %s"%Args["file"]] ).decode().rstrip().split() 
Volume=(100.0/SYSTEM_VOLUME)*float(Args['volume']);
secondsIntervals=int(Args['seconds']);
minutesIntervals=int(Args['minutes']);
maxLengthOfAudio=float(Args['maxLengthOfAudio']);
randomDistribution=int(Args['randomDistribution']);
sigma=float(Args['sigma']);
verbosity=int(Args['verbosity']);
print('\n'*2)
print('randomDistribution=%d'%randomDistribution);
print('sigma=%f'%sigma); 
print('secondsIntervals='+str(secondsIntervals));
print('minutesIntervals='+str(minutesIntervals));
print('Volume=%f'%Volume);
print('maxLengthOfAudio=%f'%maxLengthOfAudio);
print('verbosity=%d'%verbosity);
Intervals=secondsIntervals+minutesIntervals*60
usualTimeArray=np.arange(0,3600,Intervals);
if (randomDistribution==1):
    timeArray = usualTimeArray + np.random.normal(0,sigma,np.size(usualTimeArray) ).astype(int) ;
elif(randomDistribution==2):
    timeArray= np.sort( np.random.uniform(0,3600,np.size(usualTimeArray)).astype(int) );
else:
    timeArray = usualTimeArray;
print('\n'*2)
Count=0;
while True:
  secondsNow=int(sb.check_output(["date", "+%S"]  ).decode().strip()) ; #print(secondsNow) ;
  minutesNow=int(sb.check_output(["date", "+%M"]  ).decode().strip()) ; #print(minutesNow) ;
  isItTheTimeToPlay=minutesNow*60+secondsNow;
 # if (  secondsNow % secondsIntervals ==0 and minutesNow %minutesIntervals ==0   ):
  if( isItTheTimeToPlay in timeArray ):
    Count=Count+1;
    if( ( minutesNow in [59,10,20,30,40,49,0] )  and secondsNow ==0 ) :
        pass;
    else:
      shuffledFileName=np.random.choice(FILELIST)
      if (verbosity):
        print('%d\t%s\t\t\t%d'%(Count,shuffledFileName.split('/')[-1],secondsNow))
      lengthOfAudioFile=float(sb.check_output(["bash","-c","sox --info -D %s"%shuffledFileName]).decode().split()[0])
      if(lengthOfAudioFile>maxLengthOfAudio):
          startTime=np.random.uniform(0,1)*(lengthOfAudioFile-maxLengthOfAudio);
      else:
          startTime=0;
      sb.check_output(["bash","-c","nohup play --volume %f %s trim %f %f  > /dev/null 2>/dev/null"%(Volume,shuffledFileName,startTime,maxLengthOfAudio)]) 
      time.sleep(1)
      













