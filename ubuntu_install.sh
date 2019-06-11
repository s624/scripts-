#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y

#PACKAGE_LIST="google-chrome calendar-indicator artha gfortran g++ gcc gedit gedit-developer-plugins python3 python-pip python3-pip python-numpy python-scipy python-dev gimp gnuplot gnuplot-x11 gparted kate kile okular open-jdk-9-jre openssh-client openssh-server openssl pulseaudio simple-scan synaptic vim texmaker nautilus-dropbox vlc smplayer texlive-full "

PACKAGE_LIST="pm-utils  tmux   calendar-indicator artha gedit gedit-developer-plugins python3 python-pip python3-pip python-numpy python-scipy python3-numpy python3-scipy python-dev gimp gnuplot gnuplot-x11 gparted texmaker okular open-jdk-9-jre openssh-client openssl pulseaudio simple-scan synaptic vim vim-gnome nautilus-dropbox vlc smplayer texlive-full gfortran  git sox libsox-fmt-all pidgin qpdfview xkbset tlp powertop mesa-utils ffmpeg  obs-studio clipit" 
# mesa-utils  ffmpeg are prerequisites for obs-studio 
# obs-studio is open broadcast studio
# sox is terminal based music player

for PACKAGE in ${PACKAGE_LIST}
    do
        sudo apt-get install ${PACKAGE} -y
        case ${PACKAGE} in
            "google-chrome"*)
                wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
                sudo apt-get install -f
                rm google-chrome-stable*
		;;
            "nautilus-dropbox"*)
                sudo apt-get install ${PACKAGE}
                sudo apt-get install -f
                nautilus --quit
		;;
        esac
    done


PACKAGE_LIST_2=" git-all cmake chromium-browser python-espeak ipython3 gnome-tweaks openjdk-11-jdk     libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386  javacc javacc-doc"
for PACKAGE in ${PACKAGE_LIST_2} 
	do 
		sudo apt install ${PACKAGE} -y 
	done	
pip install gTTS

	
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux_ressurect/
git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/plugins/continuum/





### comment
### Now add these lines in ~/.tmux.conf file if these lines are not already there. 
###  run-shell  ~/.tmux/plugins/tmux_ressurect/resurrect.tmux
###  set -g @resurrect-capture-pane-contents 'on'                 

###  run-shell ~/.tmux/plugins/continuum/continuum.tmux
###  set -g @continuum-restore 'on'


###--these are for the cron--###

#Edit the crontab file with command 
# EDITOR=vim crontab -u user-name -e 
#List the crontab with the command
# crontab -u user-name -l 
# to start the cron service type in the terminal 
# /etc/init.dcron {start/stop/status/restart/reload/force-reload}
# https://www.geeksforgeeks.org/crontab-in-linux-with-examples/

#take a back up of cron file from /var/spool/cron/crontab/username

cd ~/.Alpha/
sudo dpkg -i ~/.Alpha/megasync-xUbuntu_18.04_amd64.deb
sudo apt-get install -f 
sudo dpkg -i ~/.Alpha/nautilus-megasync-xUbuntu_18.04_amd64.deb
sudo apt-get install -f


#these are the dependencies for xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape
make
sudo make install


sudo snap install --classic eclipse








