# coding: utf-8
import subprocess, numpy as np
strng=[i for i in subprocess.check_output( ["amixer", "sget", "Master"] ).decode().split(' ') if ( len(i)>3 and i[0]=='[' and '%' in i  )  ][0]     
strng=strng.replace('[','')
strng=strng.replace(']','')
strng=strng.replace('%','')
vol=float(strng)
print( vol )
