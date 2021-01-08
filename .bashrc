# ~/.bashrc: executed by bash(1) for non-login shells.
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

###################################################
# Written for  Gnu-Linux O.S.x64                  #
#Git Hub Page : https://github.com/freddii        #
#                                                 #
#                                                 #
#  __              _     _ _ _                    #
# / _|_ __ ___  __| | __| (_|_)                   #
#| |_| '__/ _ \/ _` |/ _` | | |                   #
#|  _| | |  __/ (_| | (_| | | |                   #
#|_| |_|  \___|\__,_|\__,_|_|_|                   #
#                                                 #
#                                                 #
#                                                 #
###################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#make nnn use nano
export EDITOR=nano

export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview;k:kdeconnect'

TELNUMBER=015123456789

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# timestamp at beginning
#export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "

# set PATH so it includes user's private bin directories
# PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$HOME/bin:$HOME/.local/bin:/sbin:$PATH"
export PATH

#alias vpn="sudo openvpn --pkcs12 /path/to/file/xx.p12 --config /path/to/file/xx.ovpn"
alias vpn-my="cd /media/v*/v*/ && sudo openvpn --config xx.ovpn"
alias vpn-proton="sudo openvpn --config /home/$USER/Downloads/ProtonVPN_server_configs/us-free-01.protonvpn.com.tcp.ovpn"

# confirm before overwriting something
#alias cp="cp -i"
#alias mv='mv -i'
#alias rm='rm -i'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Changing "ls" to "exa"
alias lls='exa -al --color=always --group-directories-first' # my preferred listing
alias lla='exa -a --color=always --group-directories-first'  # all files and dirs
alias lll='exa -l --color=always --group-directories-first'  # long format
alias llt='exa -aT --color=always --group-directories-first' # tree listing
alias ll.='exa -a | egrep "^\."'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias alert2='zenity --warning --text "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert2$//'\'')"

#upgrade and clean
alias upd="sudo apt-get update"
alias upg="sudo apt-get upgrade"
alias upgo="sudo apt-get --only-upgrade install" #apt apt-utils
alias dupg="sudo apt-get dist-upgrade"
alias fupg="sudo apt-get full-upgrade"
alias upup="sudo apt-get -qq update && sudo apt-get -qq -y upgrade && sudo apt-get -qq -y dist-upgrade && sudo apt-get -qq autoremove && sudo apt-get -qq -y clean && sudo apt-get -qq -y autoclean"

alias reboot="sudo reboot 00"
alias shutdown="sudo shutdown 00"

#sync backups
alias rsyncdry1="rsync -rtuv --links --dry-run /media/$USER/festplatte_weiss/* /media/$USER/festplatte_schwarz/"
alias rsyncdry2="rsync -rtuv --links --dry-run /media/$USER/festplatte_schwarz/* /media/$USER/festplatte_weiss/"
alias rsync1="rsync -rtuv --links /media/$USER/festplatte_weiss/* /media/$USER/festplatte_schwarz/"
alias rsync2="rsync -rtuv --links /media/$USER/festplatte_schwarz/* /media/$USER/festplatte_weiss/"

alias rsyncdry="rsync -rtuv --links --dry-run"

#view logs
alias lw="sudo logwatch --detail high --range yesterday --format html --filename "/tmp/test.html" && sudo chown $USER:$USER /tmp/test.html && x-www-browser /tmp/test.html"
alias lwa="sudo logwatch --detail high --range  All --format html --filename "/tmp/test.html" && sudo chown $USER:$USER /tmp/test.html && x-www-browser /tmp/test.html"

#keylog
alias logkey="sudo logkeys --kill && sudo logkeys --start -m /etc/logkeys/de.map --output /home/$USER/Desktop/test.log"

#One line keylogger
alias olkeylog="xinput list | grep -Po 'id=\K\d+(?=.*slave\s*keyboard)' | xargs -P0 -n1 xinput test"

#sdr things
alias rtl="rtl_433 -C si"
#alias dumpi="cd ~/programs_setup/dump1090; x-www-browser http://localhost:8080 & ./dump1090 --interactive --net"
alias dumpi="dump1090-mutability --interactive"

#show applications that use ports
alias ports-protocol='netstat -nape --inet --inet6'
alias ports-apps='sudo lsof -i -P | grep LISTEN'

alias ports-active="sudo netstat -tulpen | grep LISTEN"
alias ports-open="sudo lsof -i | grep LISTEN"
alias ports-all="sudo netstat -tulpen"
alias port="netstat -tulanp"

#top process eating memory
#alias psmem="ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6"
#alias psmem5="psmem | tail -5"
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias lmem="echo 'top mem processes:' && ps axch -o cmd:15,%mem --sort=-%mem | head"

#top process eating cpu
#alias pscpu="ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 5"
#alias pscpu5="pscpu | tail -5"

alias lcpu="echo 'top cpu processes:' && ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias fcpu='watch grep \"cpu MHz\" /proc/cpuinfo'

# show your processes
alias psmy="ps -ef | grep $USER"

# show all processes
alias psall="ps -ef"

#show running processes
alias psrun="command systemctl --no-page --no-legend --plain -t service --state=running"

# empty the your trash-dir
alias emptytrash="rm -rfv ~/.local/share/Trash/*"

#tmux short
#alias ta='tmux a -t'
#alias tad='tmux a -d -t'
#alias ts='tmux new-session -s'
#alias tl='tmux ls'
#alias tq='tmux kill-session -t'
#
#alias txl='tmux ls'
#alias txn='tmux new -s'
#alias txa='tmux a -t'

alias tmuxn="tmux attach -t session_$USER || tmux new -s session_$USER"

#change to common dirs
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

#terminal clock
alias tclock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &"

#show biggest packages
alias pkgsize="dpkg-query -Wf '\${Installed-Size}\t\${Package}\n' | sort -n"

#show all authors of a project
alias gita="git log --format='%aN' | sort -u"

#
alias gits="git status"
alias gitd="git diff"
alias gitpull="git reset --hard HEAD && git clean -xffd && git pull"
alias gitclone1="git clone --depth=1"
alias giti="git update-index --assume-unchanged" #gitignore
alias gitg="git grep"

#print weekday of birthday
alias mybday='DAY=01; MONTH=01; YEAR=1911; CURRENT_YEAR=$(date +%Y); for i in $(seq $YEAR $CURRENT_YEAR); do echo -n "$i -> "; date --date "$i-$MONTH-$DAY" +%A; done'

#show all friday the 13.
alias fr13='for y in $(seq 2018 2030); do echo -n "$y -> "; for m in $(seq 1 12); do NDATE=$(date --date "$y-$m-13" +%w); if [ $NDATE -eq 5 ]; then PRINTME=$(date --date "$y-$m-13" +%B);echo -n "$PRINTME "; fi; done; echo; done'

alias bigdir="du -hs */ | sort -hr | head"
alias bigfile="find */ -size +100M"
alias bigfileglobal="ncdu"

alias lprinters="lpstat -p"

#make a screenshot on android over adb
alias andshot="adb exec-out screencap -p > screenshot.png && xdg-open screenshot.png" #display

#create a picture from cam and show it
alias shot="mkdir -p $HOME/Pictures/ && namex=$HOME/Pictures/$(date +"%Y_%m_%d_%I_%M_%S").jpg && fswebcam -d /dev/video0 -r 640x480 \$namex && xdg-open \$namex"

#Find usb device in realtime
alias findusb="watch -n 0,2 lsusb"

#dont log current session to history
alias nohistory="unset HISTFILE"

#check if ufw (uncomplicated firewall) is enabled in bash
alias ufwstatus='if grep ENABLED=yes /etc/ufw/ufw.conf>/dev/null; then echo "enabled"; else echo "disabled"; fi'

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

#Find where a kind of file is stored
#locate *.desktop
#locate *.zip

#alias mostusedcmd="history | awk '{a[\$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head"

#clear cache and log
alias clearlogscache="bleachbit -l | egrep 'cache|log' | xargs bleachbit -c"

#show free memory
alias free="free -ht --si"

#show size of folders
alias fsize="du -sh ./*"
alias freedisk="df -h"


#list installed fonts
alias lfonts="fc-list | cut -d':' -f2 | sort -u"

#find duplicates in current directory recursive
alias finddouble="fdupes -r ."

#ssh root@server.com "tcpdump -i INTERFACE_NAME -U -nnn -s0 -w - 'port 80'" | /cygdrive/c/Program\ Files/Wireshark/Wireshark.exe -N mnNtCd -k -i -

alias fuck='eval $(thefuck $(fc -ln -1))'
alias please='fuck'
#
# IP addresses
alias wanip="curl -s ifconfig.me && echo"
alias localips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias localip="localips | grep -v 127.0.0.1"

alias iplocal="hostname -I | awk '{print \$1}'"
echo "IP: $(iplocal)   STARTUP: $(uptime -s)"
alias ipexternal="curl -s checkip.dyndns.org | sed 's/[^0-9.]//g'"
alias hardwareinfo="inxi -F"
alias powertop="sudo powertop"
alias iwconfig="sudo iwconfig"
#
alias pastebin='curl -F "sprunge=<-" http://sprunge.us' #echo Hello world. | curl -F 'f:1=<-' ix.io
alias gksu='pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY'
alias nano='nano -c'
alias hideusername="PS1=$"
alias kali="PS1=\n \[\033[0;34m\]┌─────[\[\033[1;35m\]\u\[\033[0;34m\]]─────(\[\033[1;32m\]\w\[\033[0;34m\]) \n └> \[\033[1;36m\]\$ \[\033[0m\]"
alias idebkiss="cd /tmp && git clone https://github.com/freddii/program_installers && cd program_installers && ./debkiss.sh"
alias debkiss="$HOME/programs_setup/program_installers/debkiss.sh"
alias debkiss-update="cd $HOME/programs_setup/program_installers/ && git pull"
alias week='date +%V'
alias perms='stat -c "%a %n"'
alias oct='octave-cli -q'
alias tmp='mkdir /tmp/$$ ; cd /tmp/$$'
alias untmp='rm -rf /tmp/$$'
alias hr='printf $(printf "\e[$(shuf -i 91-97 -n 1);1m%%%ds\e[0m\n" $(tput cols)) | tr " " ='
alias 1live='mpv http://wdr-1live-live.icecast.wdr.de/wdr/1live/live/mp3/128/stream.mp3'
alias wdr2='mpv http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3' #or mpg123 --headphones --no-icy-meta
alias wdr5='mpv http://wdr-wdr5-live.icecast.wdr.de/wdr/wdr5/live/mp3/128/stream.mp3'
alias listhardware='sudo lshw -short'
alias systeminfo="inxi -v6"

alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias countfiles='find . -type f | wc -l'
alias speedometer="speedometer -rx $(echo $(ls /sys/class/net) | grep -o '\bwl\w*') -tx $(echo $(ls /sys/class/net) | grep -o '\bwl\w*')"
alias networkspeedtest="speedtest-cli --simple"
alias simplehttpserver="python -m SimpleHTTPServer 9090"
alias busyboxserver="busybox httpd -p 8000 -v -f"
alias zippw="zip secure.zip * --recurse-paths --password"  #MY_SECRET
alias pdfinfo="exiftool -a -G1"
alias ufwe="sudo ufw enable"
alias ufwd="sudo ufw disable"
alias ufws="sudo ufw status"
alias gpgc="gpg --encrypt"
alias gpgd="gpg --decrypt"
alias jctlf="journalctl --follow"
alias jctl="sudo journalctl -p 3 -xb" # get error messages from journalctl
alias logsdel10d="sudo journalctl --vacuum-time=10d"
alias logsize="sudo journalctl --disk-usage"
alias joke="curl -s 'http://jokedb.xyz/random'  | jq -r '.content.text'"
alias dmesgx="sudo dmesg --follow --human"
alias tailx="tail -n0 -f"
alias xclip="xclip -selection clipboard"
alias ethstatus="ethstatus -i $(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)"
alias iup="$HOME/.local/bin/inet-unblock.sh"
alias idown="$HOME/.local/bin/inet-block.sh"
#https://pimylifeup.com/raspberry-pi-git-server/
alias pi-gitc="mkdir -p /home/pi/git/$1 && cd /home/pi/git/$1 && git init --bare" #git create new repo
alias pi-gitira="git init && git remote add $1 pi@raspberrypi.fritz.box:/home/pi/git/$1" #git init remote add
#git clone pi@raspberrypi.fritz.box:/home/pi/git/testgit
# alternative to tattooing this to my arm
alias symlink="echo ln -s EXISTING_FILE SYMLINK_FILE"
alias strace="strace --string-limit 999"
alias tracenet="strace --string-limit 9999 -e trace=network"
alias killid="sudo kill -9"
alias sysinfo="more /etc/os-release"
alias webradio="welle-cli -c 11D -C 1 -w 7979 & xdg-open http://localhost:7979/"
alias chownuser="sudo chown -c $USER"
alias chmodall="chmod 777"
alias recoverfiles="foremost -t all -v -i /dev/sdcard -/home/$USER/Desktop/recovery" #fdisk -l #to get dev/sdcard
alias mat="mat2"
alias cam="ffplay -f v4l2 -framerate 25 -video_size 640x480 -i "${1:-/dev/video0}" -vf hflip"
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
alias thonny="$HOME/apps/thonny/bin/thonny %F"
alias bwifi="sudo rfkill block wifi"
alias ubwifi="sudo rfkill unblock wifi"
alias apts="apt show"
alias dpkgi="dpkg --list | wc --lines"
alias shred="sudo shred -n 0 -z -v" #override all with zero
alias weather='curl wttr.in'  #weather berlin
alias info="info --vi-keys"
alias debget="apt-get download"
alias news='curl -sS "getnews.tech/$*"'
#alias bat="batcat" #colorful cat
#alias fzf="fzf --exact"
alias whisker="xfce4-popup-whiskermenu --pointer"
alias netris="ssh netris.rocketnine.space"
alias locip="$(ip addr | grep "/24" | cut -d ' ' -f 6)"
# systemd
alias ddisable='sudo systemctl disable'
alias denable='sudo systemctl enable'
alias drestart='sudo systemctl restart'
alias dstart='sudo systemctl start'
alias dstatus='sudo systemctl status'
alias dstop='sudo systemctl stop'
alias starwars="telnet towel.blinkenlights.nl" # ASCII Star Wars
alias lsources='grep "^[^#;]" /etc/apt/sources.list'
alias i="sudo apt-get install"
alias p="sudo apt-get purge"
alias arm="sudo apt-get autoremove"
alias quote='cowsay "$(fortune showerthoughts)"'
alias xquote='xcowsay -t 10 "$(fortune showerthoughts)"'
alias wamu="mpv https://hd1.wamu.org/"
alias aa-status="sudo aa-status"
alias ytdl="youtube-dl"
# termbin
alias tb="nc termbin.com 9999"
# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

alias ni="npm install"
alias nid="npm install -D"
alias nst="npm run start -s --"
alias ns="npm run server -s --"
alias nb="npm run build -s --"
alias nf="npm fund -s --"
alias nd="npm run dev -s --"
alias nt="npm run test -s --"
alias ntw="npm run test:watch -s --"
alias nv="npm run validate -s --"
alias na="npm audit"
alias naf="npm audit fix"
alias nr="rm -rf node_modules"
alias flush="rm -rf node_modules && npm i && say NPM is done"
alias nicache="npm install --prefer-offline"
alias nioff="npm install --offline"

alias docker="sudo docker"
alias dor="sudo docker run"
alias dorrm="sudo docker run --rm"
alias dorit="sudo docker run -it"
alias doritrm="sudo docker run -it --rm"
alias doritirm="sudo docker run -it --init --rm"
alias doritrmn="sudo docker run -it --rm --name"
alias doc="sudo docker container"
alias dos="sudo docker start"
alias dol="sudo docker logs"
alias dosa="sudo docker start -a"
alias dops="sudo docker ps"
alias dopsa="sudo docker ps --all"
alias dost="sudo docker stop"
alias dok="sudo docker kill"
alias dosp="sudo docker system prune"
alias doeit="sudo docker exec -it"
alias dob="sudo docker build"
alias docc="sudo docker commit -c"
alias doe="sudo docker exec" 
alias dobt="docker build --tag" 
alias docp="docker container prune"
alias doils="sudo docker image ls"
alias noi="firejail --net=none " #works for qutebrowser but not for firefox..
# no-internet
#alias no-internet="sudo -g no-internet" #seams to be broken
#alias noi2="sudo -g no-internet" #seams to be broken

# open spotify with no internet
#alias s="sudo -g no-internet spotify" #seams to be broken
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias logs="journalctl -r" #for gui use qjournal
alias logsreduce="sudo journalctl --rotate --vacuum-size=1000M && sudo du -sh /var/log/journal/"

alias debii="sudo dpkg -i"
alias dependon="apt-cache rdepends"
alias codesp="codespell -q 3 -L ans"
alias pstree1="pstree -pul"
alias netwhat='sudo lsof -Pni tcp'
alias bandwhich="sudo bandwhich"
alias deb-rdepi="apt-cache rdepends --installed"
alias deb-rrdepi="apt-cache rdepends --installed --recurse"
alias deb-rdep="apt-cache rdepends"
alias deb-rrdep="apt-cache rdepends --recurse"


gpgdw(){
filen=$(echo "$1" | head -c-5)
gpg -d "$1" > $filen

}

#write diary
diary(){
	if [ -f ~/.diary.txt ]; then
    		echo " " >>~/.diary.txt && echo " " >>~/.diary.txt
	fi
	echo "---------------------------" >>~/.diary.txt && date >>~/.diary.txt && echo "---------------------------" >>~/.diary.txt &&  chmod 600 ~/.diary.txt && nano +10000000 ~/.diary.txt
}

# e.g. gitpush "updated my code"
gitpush(){
    git add -A && git commit -m "$1" && git push origin HEAD:master
}

# e.g. gitsubdir https://github.com/freddii/liveTV/tree/master/liveTV_png
gitsubdir(){
	local URL=$1
	local NEW_URL=$(echo $URL | sed 's|/tree/master|.git/trunk|g')
	svn export $NEW_URL
}

#usage: gitget https://github.com/freddii/dotfiles
#maybe better use: git clone --depth=1 https://github.com/freddii/dotfiles
gitget(){
	wget $1/archive/master.zip && unp master.zip && rm master.zip
}

yt2mp3(){
	mkdir -p $HOME/Music
#	sudo -H \
#	pip3 install --upgrade youtube-dl
	cd $HOME/Music && youtube-dl --extract-audio --audio-format mp3 "$1"
	cd $HOME
}

#will create a mkv file
yt2video(){
	mkdir -p $HOME/Videos
#	sudo -H \
#	pip3 install --upgrade youtube-dl
	cd $HOME/Videos
	youtube-dl "$1"
	cd -
}

#usage: yt2vlc "shaun das schaf"
yt2vlc(){
	GET https://www.youtube.com/results?search_query=$(echo $1 | sed -e 's/ /+/g') | sed -ne '/<a href="\/watch.*title="/s/.*<a href="\(\/watch[^"]*\)".* title="\([^"]*\)".*/https:\/\/www.youtube.com\1/p' | vlc -
}

#view youtube without sign in for age
#usage: ytembed url
ytembed(){
	local newurl=$(echo "$1" | sed 's:watch?v=:embed/:')
	echo $newurl
	exo-open --launch WebBrowser "$newurl"
}

#usage: hotspot
hotspot(){
#	wlan0=$(echo $(ls /sys/class/net) | cut -d' ' -f4)
#	wlan0=$(iwgetid | grep -o '\bwl\w*' | tail -1)
	local hotspotpw="1234test1234" #$1
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
	echo $wlan0
	nmcli dev wifi hotspot ifname $wlan0 ssid wlanspot password $hotspotpw
	echo "started hotspot:"
	echo "SSID: wlanspot"
	echo "password: $hotspotpw"
	echo "this server ip: $(hostname -I)"
}

#monitor wlan
monwlan(){
#	wlan0=$(echo $(ls /sys/class/net) | cut -d' ' -f4)
#	wlan0=$(iwgetid | grep -o '\bwl\w*' | tail -1)
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
	echo $wlan0
	sudo ifconfig $wlan0 down && \
	sudo iwconfig $wlan0 mode monitor && \
	sudo ifconfig $wlan0 up
	sudo tshark -l -i $wlan0 -f 'type mgt subtype probe-req' -T fields -e frame.time -e wlan.sa_resolved -e wlan_radio.channel -e radiotap.dbm_antsignal -e wlan.ssid -E separator=,
}

#monitor wlan
monwlan2(){
#	wlan0=$(echo $(ls /sys/class/net) | cut -d' ' -f4)
#	wlan0=$(iwgetid | grep -o '\bwl\w*' | tail -1)
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
	echo $wlan0
	sudo ifconfig $wlan0 down && \
	sudo iwconfig $wlan0 mode monitor && \
	sudo ifconfig $wlan0 up
	sudo airodump-ng $wlan0 --manufacturer
}

manwlan(){
#	wlan0=$(echo $(ls /sys/class/net) | cut -d' ' -f4)
#	wlan0=$(iwgetid | grep -o '\bwl\w*' | tail -1)
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
	echo $wlan0
	sudo ifconfig $wlan0 down && \
	sudo iwconfig $wlan0 mode managed && \
	sudo ifconfig $wlan0 up
}

qrwifi(){
	local thepath=$(zenity --file-selection --filename=/etc/NetworkManager/system-connections/)
	local wifissid=$(sudo grep "ssid=" $thepath | cut -d "=" -f 2)
	local wifipw=$(sudo grep "psk=" $thepath | cut -d "=" -f 2)
	qrencode -s 7 -o /tmp/qr-wifi_$wifissid.png "WIFI:S:$wifissid;T:WPA;P:$wifipw;;"
	convert /tmp/qr-wifi_$wifissid.png -background White -pointsize 18 label:'SSID:'$wifissid -gravity Center -append /tmp/qr-wifi2_$wifissid.png
	convert /tmp/qr-wifi2_$wifissid.png -background White -pointsize 18 label:'Password:'$wifipw -gravity Center -append /tmp/qr-wifi3_$wifissid.png
	rm /tmp/qr-wifi_$wifissid.png
	rm /tmp/qr-wifi2_$wifissid.png
	xdg-open /tmp/qr-wifi3_$wifissid.png
}

qrwifi2(){
	cd /etc/NetworkManager/system-connections && ls
	qrencode -s 7 -o /tmp/qr-wifi.png "WIFI:S:$(zenity --entry --text="Network name (SSID)" --title="Create WiFi QR");T:WPA;P:$(zenity --password --title="Wifi Password");; "
	xdg-open /tmp/qr-wifi.png
	cd $HOME
}

# e.g. manpdf nano
manpdf(){
man -t $1 | ps2pdf - > /tmp/$1.pdf && xdg-open /tmp/$1.pdf
}

# e.g. tmux4run "sudo apt update"
tmux4run(){
	tmux attach -t tmuxfour || \
	(tmux new-session -s tmuxfour -d; \
	tmux split-window -d -t 0 -v; \
	tmux split-window -d -t 0 -h; \
	tmux split-window -d -t 2 -h; \
	tmux send-keys -t 0 'clear && echo -e "Ctrl-b release keys then d #detach session \nCtrl-b release keys then z #panel full screen, shrink back  \nCtrl-b release keys then o #switch trough sessions \ntmux ls #list sessions"' enter; \
	tmux send-keys -t 1 'clear' enter; \
	tmux send-keys -t 2 'clear' enter; \
	tmux send-keys -t 3 'clear' enter; \
	tmux send-keys -t 3 "$1"; \
	tmux select-pane -t 3; \
	tmux attach -t tmuxfour)
}

# e.g. speak "hallo Welt"
speak(){
	#de-DE
	if [ -f /tmp/speak.wav ]; then
		rm /tmp/speak.wav
	fi
	pico2wave --lang=en-US --wave=/tmp/speak.wav "$1" && aplay /tmp/speak.wav 2>/dev/null #&& rm /tmp/speak.wav
}

#usage: speak-high "whats up"
speak-high(){
	pico2wave --lang=en-US --wave=/tmp/speak.wav "$1" && \
	sox /tmp/speak.wav /tmp/speakbad.wav pitch 600 overdrive 20 pad .25 && \
	aplay /tmp/speakbad.wav 2>/dev/null && rm /tmp/speak.wav && rm /tmp/speakbad.wav
}

#usage: speak-low "whats up"
speak-low(){
	pico2wave --lang=en-US --wave=/tmp/speak.wav "$1" && \
	sox /tmp/speak.wav /tmp/speakbad.wav pitch -600 overdrive 20 pad .25 && \
	aplay /tmp/speakbad.wav 2>/dev/null && rm /tmp/speak.wav && rm /tmp/speakbad.wav
}

#create example file: pico2wave --lang=en-US --wave=/tmp/speak.wav "This is a test."
#usage: speech2text /tmp/speak.wav
speech2text(){
	local shortname=$(echo $1 | sed 's:.*/::' | cut -d'.' -f1)
	cd $HOME/programs_setup/deepspeech-venv/bin/
	./deepspeech --model ~/programs_setup/deepspeech-venv/models/output_graph.pbmm --alphabet ~/programs_setup/deepspeech-venv/models/alphabet.txt --lm ~/programs_setup/deepspeech-venv/models/lm.binary --trie ~/programs_setup/deepspeech-venv/models/trie --audio $1 >$HOME/Desktop/$shortname.txt; xdg-open $HOME/Desktop/$shortname.txt && cd ~ #alert && cd ~
	#speak "$(<$HOME/Desktop/$shortname.txt)"
}

#speak "this is another test. Hello world." && speech2text /tmp/speak.wav && text2pic "$(cat $HOME/Desktop/speak.txt)" && xdg-open text.gif

#usage: text2pic "test this\n now!"
text2pic(){
	echo -e $1 | convert -background none -density 196 -resample 72 -unsharp 0x.5 -font "Courier" text:- -trim +repage -bordercolor white -border 3 text.gif && xdg-open text.gif
}

#get kws
slmp(){
	local MPURL=$1
	echo $(wget --quiet $MPURL -O - | grep '<meta name="keywords" content="\K[^"]+' -oP | head -1)
}

#what packages were installed last
lastinstalled(){
	echo "last installed packages:" && ls -cltr /var/lib/dpkg/info/ | grep \.list | tail -n 300 #>/tmp/installed.txt
	#nano +10000000 /tmp/installed.txt
}

#usage: iiwhat nano
iiwhat(){
	which "$@" | xargs -r readlink -f | xargs -r dpkg -S ;
}

kdesms(){
	kdeconnect-cli --destination $TELNUMBER --device $(kdeconnect-cli -a --id-only) --send-sms "$1"
}

#find phone
kdering(){
	kdeconnect-cli --ring --device $(kdeconnect-cli -a --id-only)
}

pdf2text(){
	pdftotext -layout $1 /tmp/$1.txt && xdg-open /tmp/$1.txt
}

#reminder alarm to turn off
#usage: pause 1400 #to remind at 14:00
pause(){
	leave $1
}

#reminder infobox
remindme(){
	sleep $1 && zenity --info --text "$2"
}

daily(){
	emptytrash
	clearlogscache
	upup
	diary
}

ainfo(){
	lcpu
	lmem
	iilast
	lastedited
}

#usage: genRandomText 123
genRandomText(){
	local n=$1; while [ $((n--)) -gt 0 ]; do printf "\x$(printf %x $((RANDOM % 26 + 65)))" ; done ; echo ;
}

#usage: simtype "i am simulating typing"
#simtype $(genRandomText 100)
simtype(){
	echo $1 | pv -qL 10
}

#usage: debinstall https://github.com/boltgolt/howdy/releases/download/v2.5.0/howdy_2.5.0.deb
debinstall(){
	cd /tmp/
	wget $1
	sudo dpkg -i $(echo $1 | sed 's:.*/::')
       rm $(echo $1 | sed 's:.*/::')
}

#Get all documents (doc,docx,xls,xlsx,pdf,ppt,pptx,...) linked in a webpage
#usage: getdocs https://hackspace.raspberrypi.org/issues
getdocs(){
	curl $1 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*.*(doc|docx|xls|xlsx|ppt|pptx|pdf)" | sort | uniq > list.txt #| wget list.txt
	for file in `cat list.txt`; do wget -O $(echo $file | grep -o H.*.pdf) $file ; done
}

cpubench(){
	local CPU="${1:-1}"; local SCALE="${2:-5000}"; { for LOOP in `seq 1 $CPU`; do { time echo "scale=${SCALE}; 4*a(1)" | bc -l -q | grep -v ^"[0-9]" & } ; done }; echo "Cores: $CPU"; echo "Digit: $SCALE" ;
}

firefoxbookmarks(){
	for i in $(ls $HOME/.mozilla/firefox/*\.*/places.sqlite); do sqlite3 $i "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"; done
}

#Make changes in .bashrc immediately available
bashrc-reload(){ builtin exec bash ; }

#Finding commands to create alias for
mostused(){
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10 
}
lastedited(){
	echo "last edited:"
	#find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' 2>/dev/null | sort -nr | head -n 5 | cut -f2- -d" "
	find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' 2>/dev/null | sort -nr | head -n 200 | cut -f2- -d" "
}

#show files and directories (also in sub-dir) that was touched in the last 6 hours
alias lastedit="find ./* -ctime -6"

findhistory(){
	history | grep "$1"
}

#Finding strings and redirect errors to dev/null
#usage: findstr "test"
findstr(){
	grep -rni $pwd -e "$1" 2>/dev/null
}

fs(){
	grep -rni $pwd -e "$1" 2>/dev/null
}

#Finding strings and redirect errors to dev/null
#usage: findstr "test"
findbash(){
	grep -rni $HOME/.bashrc -e "$1" 2>/dev/null
}

#Finding files and redirect errors to dev/null
#usage: findfile "*.tx*"

findfile(){
	find . -iname "$1" 2>/dev/null
}

findsl(){
	grep -rni $HOME/.sec*/ -e "$1" 2>/dev/null #-A 1 -B 1
	grep -rni $HOME/.firest*/ -e "$1" 2>/dev/null #-A 1 -B 1
}

findglobalfile(){
	locate "$1"
}

#Finding folders and redirect errors to dev/null
#usage: finddir ".imagine_setup*"
finddir(){
	find . -iname "$1" -type d 2>/dev/null
}

#usage: findpkg "gimp"
findpkg(){
	dpkg-query -l '*'$1'*'
}

#usage: findpkg2 "gimp"
findpkg2(){
	apt-file search $1
}

#usage: finddep "gimp"
finddep(){
	apt-cache showpkg $1
}

issloc(){
	while true; do pos=$(curl -s "http://api.open-notify.org/iss-now.json"); echo "lat=$(echo $pos | jq ".iss_position.latitude"), lon=$(echo $pos | jq ".iss_position.longitude")"; sleep 1; done
}

macchange(){
	echo "old mac:" && cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/address
	#wlan0=$(echo $(ls /sys/class/net) | cut -d' ' -f3)
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*')
	#wlan0=$(ip route show default | awk '/default/ {print $5}')
	#echo $wlan0
	sudo ifconfig $wlan0 down
	sudo macchanger -r $wlan0
	sudo ifconfig $wlan0 up
}

#from phone to pc
adbpull(){
	local shortname=$(echo $1 | sed 's:.*/::')
	adb pull /mnt/shell/emulated/0/$1 $HOME/Desktop/$shortname
}

#from pc to phone
adbpush(){
	local shortname=$(echo $1 | sed 's:.*/::')
	adb push $HOME/Desktop/$1 /mnt/shell/emulated/0/$shortname
}

xrain(){
	tmux new-session -s xrainsession -d
	tmux send-keys -t xrainsession.0 'Xrain -a -13 -s 4 -o -20 -i 140 -p 2048' enter
}

kxrain(){
	tmux kill-session -t xrainsession
}

#mount a veracrypt file
#usage: vcmount /path/to/veracryptfile
vcmount(){
	local today=`date '+%Y_%m_%d__%H_%M_%S'`
	veracrypt -k "" $1 /media/veracrypt$today
}

#unmount veracrypt file
vcunmount(){
veracrypt -d
}

# usage: slbackup test_resident
#usage2: slbackup
slbackup(){
mkdir -p /home/$USER/Documents/backups
tar -zcf "/home/$USER/Documents/backups/archive-chat-$(date +"%H-%M-%S_%d-%m-%Y")$1.tgz" /home/$USER/.secondlife/$1
}

# Create a new directory and enter it
function mkd(){
	mkdir -p "$@" && cd "$@"
}

#mkcd(){
#PATHNAME=$1; mkdir -p "$PATHNAME"; cd "$PATHNAME";
#}

#usage: rmemptylines "filename"
rmemptylines(){
	sed -i '/^[[:space:]]*$/d' $1
}

#rmemptylines(){
#	grep -v '^[[:space:]]*$' "$1" | sponge "$1"
#}

#del lines with pattern
#usage: rmpatternlines "pattern" "filename"
rmpatternlines(){
	sed -i "\|$1|d" $2
}

cheat(){
	curl cheat.sh/"$1"
}

#stabilize a video
#usage: vidstab /PATH/TO/VIDEOFILE
vidstab(){
	local DIR=$(dirname "${1}")
	if [ "$DIR" == "." ]; then
	    DIR=$PWD
	fi
	local FILENAME=$(basename "${1}")
	local FILESHORT=$(echo "$FILENAME" | cut -f 1 -d '.')
	cd $DIR
	ffmpeg -i $FILENAME -vf vidstabdetect -f null -
	ffmpeg -i $FILENAME -vf vidstabtransform,unsharp=5:5:0.8:3:3:0.4 $FILESHORT-stabilized.mkv
	# side-by-side
	ffmpeg -i $FILENAME -i $FILESHORT-stabilized.mkv -filter_complex hstack $FILESHORT-merged-side-by-side.mkv
	cd -
}

#open folder in your filebrowser
o(){
	if [ $# -eq 0 ]; then
		xdg-open .;
	else
		xdg-open "$@";
	fi;
}

#colorize black and white image
colorization(){
	local DIR=$(dirname "${1}")
	if [ "$DIR" == "." ]; then
	    DIR=$PWD
	fi
	local FILENAME=$(basename "${1}")
	local FILESHORT=$(echo "$FILENAME" | cut -f 1 -d '.')
	local ENDING=$(echo "$FILENAME" | cut -f 2 -d '.')
	cd ~/programs_setup/colorization/siggraph2016_colorization
	th colorize.lua $DIR/$FILENAME $DIR/color_$FILESHORT.$ENDING
	#th colorize.lua $DIR/$FILENAME $DIR/colornet_$FILESHORT.$ENDING colornet_imagenet.t7
	#th colorize.lua $DIR/$FILENAME $DIR/colormodel_$FILESHORT.$ENDING model.t7
	cd -
}

#create an image from a pencil sketch
sketch(){
	local DIR=$(dirname "${1}")
	if [ "$DIR" == "." ]; then
	    DIR=$PWD
	fi
	local FILENAME=$(basename "${1}")
	local FILESHORT=$(echo "$FILENAME" | cut -f 1 -d '.')
	local ENDING=$(echo "$FILENAME" | cut -f 2 -d '.')
	cd ~/programs_setup/sketch-simplification/sketch_simplification
	/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $DIR/$FILENAME --out $DIR/mod_gan_$FILESHORT.$ENDING --model model_gan.t7
	#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $DIR/$FILENAME --out $DIR/mod_mse_$FILESHORT.$ENDING --model model_mse.t7
	#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $DIR/$FILENAME --out $DIR/mod_pen1_$FILESHORT.$ENDING --model model_pencil1.t7
	#/home/$USER/programs_setup/sketch-simplification/bin/python3 simplify.py --img $DIR/$FILENAME --out $DIR/mod_pen2_$FILESHORT.$ENDING --model model_pencil2.t7
	cd -
}

#find ip address of your raspberrypi
pi-ipof(){
	local lip=$(hostname -I | awk '{print $1}')
	#echo "${lip%.*}"
	sudo nmap -sP "${lip%.*}".0/24 | awk '/^Nmap/{ip=$NF}/B8:27:EB/{print ip}'
}

#find ip address of your raspberrypi
pi-ipof2(){
	local lip=$(hostname -I | awk '{print $2}')
	#echo "${lip%.*}"
	sudo nmap -sP "${lip%.*}".0/24 | awk '/^Nmap/{ip=$NF}/54:00:63/{print ip}'
}

pi-sshcopyid(){
	ssh-copy-id pi@raspberrypi.fritz.box
}

pi-sshcopyid2(){
	ssh-copy-id pi@$(pi-ipof2)
}

pi-ssh(){
	#ssh pi@192.168.0.100
	#ssh-keygen
	#ssh-copy-id pi@raspberrypi.fritz.box
	ssh pi@raspberrypi.fritz.box
}

pi-ssh2(){
	#ssh pi@192.168.0.100
	#ssh-keygen
	#ssh-copy-id pi@raspberrypi.fritz.box
	ssh pi@$(pi-ipof2)
}

#should also work from thunar
pi-zilla(){
	sftp://pi@raspberrypi.fritz.box/home/pi
}

#usage: imbackup good_resident
imbackup(){
	tar -zcf "$HOME/Documents/archive-chat-$(date +"%H-%M-%S_%d-%m-%Y")$1.tgz" $HOME/.sec*fe/$1/
}

debviz(){
	debtree $1 | dot -Tpng > /tmp/$1.png
	xdg-open /tmp/$1.png
}

#firefox saved variables
firefoxvar(){
	cd $HOME/.mozilla/firefox/ && sqlite3 `cat $HOME/.mozilla/firefox/profiles.ini | grep Path | awk -F= '{print $2}'`/formhistory.sqlite 'select * from moz_formhistory' && cd - > /dev/null
}

apt-history(){
	cd /var/log/apt && cat history.log > ~/Desktop/allhistory.log && zcat history.log*gz >> ~/Desktop/allhistory.log && cd
	echo "apt-history written to ~/Desktop/allhistory.log"
}

nethogswlan(){
#	wlan0=$(iwgetid | grep -o '\bwl\w*' | tail -1)
	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
	echo $wlan0
	sudo nethogs $wlan0
}

#getallfiles type url
getallfiles(){
	wget -r -nH --cut-dirs=1 -A.$1 --no-parent $2
}

#sudo iptraf
iftopx(){
	sudo iftop -i $(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
}

checksamefiles(){
	cmp --silent $1 $2 && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'

}

todo(){
	touch ~/Desktop/"$*"

}

#example usage: phpserver 8080
# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver(){
	local port="${1:-4000}"
	local ip="hostname -I | awk '{print \$1}'"
	echo $ip
	sleep 1 && o "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}

slurmx(){
slurm -i $(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
}

#usage: upload file
transfer(){
	curl --upload-file $1 https://transfer.sh/$1
}

transfer2(){
	curl -F "file=@$1" https://file.io/?expires=1d
}

#copy string
# Set ID and PASSWORD **AS YOU LIKE**. requires: dos2unix jq openssl base64 curl
    MYID="MYPERSONALIDFORTRANSFER"
    PASSWD="pAs5w0rD"
#example usage: cat file.txt | scopy
scopy (){
    local ENCODED
    echo "encoding.."
#
    if (( ${#} == 0 )) ; then
            ENCODED=$(cat | openssl aes-256-cbc -e -pass pass:$PASSWD -nosalt -pbkdf2 | base64); #pipe
    else
        ENCODED=$(echo "$1" | openssl aes-256-cbc -e -pass pass:$PASSWD -nosalt -pbkdf2 | base64); #argument
    fi
	echo $ENCODED
	echo "uploading file.."
	#TRANS_URL_SET=$(curl -s --upload-file <(echo $ENCODED) https://transfer.sh/$MYID)
	#local TRANS_URL_SET=$(echo $ENCODED | pastebinit)
	#https://0x0.st
	local TRANS_URL_SET=$(curl -s --data-urlencode "text=$ENCODED" https://file.io | jq --raw-output '.link')
	echo $TRANS_URL_SET
	echo "uploading url.."
	curl -H "Content-Type: text/html; charset=UTF-8" -X POST --data $TRANS_URL_SET https://api.cl1p.net/$MYID
	echo "ready."
}
#example usage: spaste > file.txt
spaste (){
	#echo "downloading url.."
	local TRANS_URL_GET=$(curl -s https://api.cl1p.net/$MYID | dos2unix)
	#echo "downloading file.."
	curl -s "$TRANS_URL_GET" | dos2unix | base64 --decode | openssl aes-256-cbc -d -pass pass:pAs5w0rD -nosalt -pbkdf2
}

#copy file
fcopy(){
	echo "decrypt file.."
	gpg -o /tmp/decryptup.gpg -c $1
	echo "uploading file.."
	local TRANS_URL_SET=$(curl -s -F "file=@/tmp/decryptup.gpg" https://file.io | jq --raw-output '.link')
	echo $TRANS_URL_SET
	echo "uploading url.."
	curl -H "Content-Type: text/html; charset=UTF-8" -X POST --data $TRANS_URL_SET https://api.cl1p.net/$MYID
	rm /tmp/decryptup.gpg
	echo "ready."
}

#paste file
fpaste(){
	dpkg -l | grep -qw dos2unix || sudo apt-get install dos2unix -y #check if dos2unix is installed
	#echo "downloading url.."
	local TRANS_URL_GET=$(curl -s https://api.cl1p.net/$MYID | dos2unix)
	#echo "downloading file.."
	curl -s "$TRANS_URL_GET" -o /tmp/decryptdown.gpg
	gpg -o $1 -d /tmp/decryptdown.gpg
	rm /tmp/decryptdown.gpg
	echo "ready."
}

twitch(){
     local INRES="1920x1080" # input resolution
     local OUTRES="1920x1080" # output resolution
     local FPS="15" # target FPS
     local GOP="30" # i-frame interval, should be double of FPS,
     local GOPMIN="15" # min i-frame interval, should be equal to fps,
     local THREADS="2" # max 6
     local CBR="1000k" # constant bitrate (should be between 1000k - 3000k)
     local QUALITY="ultrafast"  # one of the many FFMPEG preset
     local AUDIO_RATE="44100"
     local STREAM_KEY=$(cat $HOME/.twitch) # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     local SERVER="live-sao" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list

     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f pulse -i 0 -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }

wdrnews(){
	mpv --no-video "https:"$(wget https://www1.wdr.de/radio/wdr2/app/wdrzweinachrichten106.html -O - | egrep '//wdr[A-Za-z0-9,_.-]{1,20}akamaihd.net[A-Za-z0-9,_.-\/]{1,50}wdraktuell_[0-9,_.-]{1,20}_wdraktuellum[0-9,_]{1,10}uhr_wdr2.mp3' -o)
}

ts(){
	local streamurl="https:"$(wget https://www.tagesschau.de/sendung/letzte-sendung/ -O - | egrep '//download.media.tagesschau.de/video/[A-Za-z0-9,_.-\/]{1,50}TV-[0-9,_.-]{1,40}.webm.h264.mp4' -o)
	echo "streamurl: "$streamurl
	mpv $streamurl
}

ts100(){
	local streamurl="https:"$(wget https://www.tagesschau.de/100sekunden/ -O - | egrep '//download.media.tagesschau.de/video/[A-Za-z0-9,_.-\/]{1,50}TV-[0-9,_.-]{1,40}.webm.h264.mp4' -o)
	echo "streamurl: "$streamurl
	mpv $streamurl
}

# wondershaper is not working with ipv6..
#wondershaperon(){
#	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
#	echo $wlan0
#	sudo wondershaper -a $wlan0 -d 1024 -u 500 #old syntax
#	#sudo wondershaper $wlan0 1024 500 #new syntax
#}

#wondershaperoff(){
#	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
#	echo $wlan0
#	sudo wondershaper -c -a $wlan0 #old syntax
#	#sudo wondershaper clear $wlan0 #new syntax
#}

#wondershaperstatus(){
#	local wlan0=$(echo $(ls /sys/class/net) | grep -o '\bwl\w*' | tail -1)
#	echo $wlan0
#	sudo wondershaper $wlan0
#}

gimpxcffonts(){
	grep -aPo 'font "(.*?)"' $1
}

multipics(){
	mkdir -p $HOME/Pictures
	cd $HOME/Pictures
	gmic "$1" to_rgba rotate_tiles 10,8 drop_shadow 10,10 output $HOME/Pictures/mod1_"$(basename -- $1)"
	gmic "$1" fx_vector_painting 9.37,0 output $HOME/Pictures/mod2_"$(basename -- $1)"
	gmic "$1" fx_vector_painting 9.70,30 output $HOME/Pictures/mod3_"$(basename -- $1)"
	gmic "$1" normalize_local 10,16 rodilius 10,4,400,16 smooth 60,0,1,1,4 normalize_local 10,16 output $HOME/Pictures/mod4_"$(basename -- $1)"
	gmic "$1" fx_gcd_etch 125,153,171,185,0.1,50,80,50,10,15,12,20,0,1,0.3,1,0,0 output $HOME/Pictures/mod5_"$(basename -- $1)"
	gmic "$1" fx_tk_vintage 2,0.85,0.7,80,200,5,147,26,161,0.3,235,220,176,0.4,190,181,108,0.2,0,0,100,0,0.3,25,0,0 output $HOME/Pictures/mod6_"$(basename -- $1)"
	gmic "$1" fx_reflect 50,1,110,160,190,64,0,1.5,0,-3.3,7,1.5 output $HOME/Pictures/mod7_"$(basename -- $1)"
	gmic "$1" jeje_clouds 50,0.5 output $HOME/Pictures/mod8_"$(basename -- $1)"
	cd $HOME
}

freetuxtv-english(){ nvlc "http://database.freetuxtv.net/WebStreamExport/index?format=m3u&type=1&status=2&lng=en&isp=all" ;}
freetuxtv-german(){ nvlc "http://database.freetuxtv.net/WebStreamExport/index?format=m3u&type=1&status=2&lng=de&isp=all" ;}

convertaudiocd2mp3(){ cdparanoia -B ; for f in *.wav ; do sox -S $f "${f%.wav}.mp3" ; rm $f ; done ;}

rdesktop-win10(){
  local ipaddr=192.168.1.115
  local port=3389
  local username=winuser
  local resolution=1920x1020
  echo -e "${Yellow}>>>Check if remote computer is alive at $ipaddr:$port ${Color_Off}"
    until nc -vzw 2 "$ipaddr" "$port"; do sleep 2; done
  echo -e "${Green}>>>Connecting to remote computer${Color_Off}"
    rdesktop -a 32 -u "$username" -g "$resolution" "$ipaddr":"$port" -r sound:local
}

convert2pdf(){
	if [ $# -lt 1 ]; then
		echo -e "Usage: $0 <file_name>.<doc|docx|ppt|pptx|xls|xlsx|txt|rtf|html|epub|cbr|cbz|cbt|cb7|cba|jpg|jpeg|pbm|pgm|png>"
		echo -e "\nsingle:   $0 file.doc"
		echo -e "\nmultiple: $0 file1.jpg file2.jpg file3.jpg"
		echo -e "\nwildcard: $0 *.png"
		echo -e "\nRequirement: calibre imagemagick libreoffice"
        return 1
	else
		if [ ! -f "${1%.*}".pdf ] ; then
		NAME=${1%.*}
		case "$1" in
		  *.doc|*.docx|*.odt)    soffice --headless --convert-to pdf "$@" ;;
		  *.ppt|*.pptx)    soffice --headless --convert-to pdf "$@" ;;
		  *.xls|*.xlsx)    soffice --headless --convert-to pdf "$@" ;;
		  *.txt|*.rtf)     soffice --headless --convert-to pdf "$@" ;;
		  *.html)          soffice --headless --convert-to pdf "$@" ;;
		  *.epub)          soffice --headless --convert-to pdf "$@" ;;
		  *.cbr|*.cbz|*.cb7|*.cbt|*.cba)    ebook-convert "$1" .pdf ;;
		  *.jpg|*.jpeg|*.pbm|*.pgm|*.png)   convert "$@" "${1%.*}"-`date +'%F_%Hh%Ms%S'`.pdf ;;
		  *)               echo "'$1' - unsupported format or file does not exist" ;;
		esac
		else
			echo "'${1%.*}.pdf' - file exist, skipping to prevent overwrite"
		fi
	fi
}

ocrpng(){
	convert2pdf input.png
	ocrmypdf --sidecar output.txt input*.pdf output.pdf
}

date-global(){
# use tzselect to find timezone listing
    local SHOWTIMEZONE="$(
    alias date='date +"%a %D %k:%M %p"'
    echo "Current Location:" "$(date)"
    echo "USA LosAngeles:" "$(TZ='America/Los_Angeles' date)"
    echo "Canada Alberta:" "$(TZ='America/Edmonton' date)"
    echo "USA NewYork:" "$(TZ='America/New_York' date)"
    echo "EU London:" "$(TZ='Europe/London' date)"
    echo "Bangladesh Dhaka:" "$(TZ='Asia/Dhaka' date)"
    echo "China Xinjiang:" "$(TZ='Asia/Urumqi' date)"
    echo "Vietnam Saigon:" "$(TZ='Asia/Ho_Chi_Minh' date)"
    echo "China Beijing:" "$(TZ='Asia/Shanghai' date)"
    echo "HK HongKong:" "$(TZ='Asia/Hong_Kong' date)"
    echo "Japan Tokyo:" "$(TZ='Asia/Tokyo' date)"
    )"
    echo "$SHOWTIMEZONE" | column -t
}

#needs aspell installed
check-word(){ echo "$1" | aspell -a ;}
check-list(){ cat "$1" | aspell list ;}
check-file(){ aspell check "$1" ;}

rpl-all(){
	find . -type f -exec sed -i "s|$1|$2|g" {} \;
}

#replace all patterns
#usage: replacepattern "pattern" "replacestring" "filename"
#replacepattern(){
#	find . -type f -name "*.txt" -print0 | xargs -0 sed -i '' -e 's/foo/bar/g'  #this does not work ??!?!?!
#}

findopen(){
	find . -type f -exec grep -q "$1" {} \; -exec cudatext {} +
}

mpvrec(){
	mpv --record-file=/$HOME/Desktop/stream$(date "+%Y_%m_%d-%H_%M_%S").ts "$1"
}

gitbkp(){
	#url="http://www.test.com/abc/def/efg/file.jar"
	#basename "$url"; basename -s .jar "$url"; dirname "$url"
	#file.jar
	#file
	#http://www.test.com/abc/def/efg
	git clone "$1"
	local url=$1
	local repo=$(basename "$url")
	local userlink=$(dirname "$url")
	local user=$(basename $userlink)
	zip -r -q "$user"_"$repo"_$(date +%Y-%m-%d_%H-%M).zip $repo/
	rm -rf $repo
}

#gitbkpall geek1011
gitbkpuser(){
	local FOLDER=$(date +%Y-%m-%d_%H-%M-%S)
	mkdir $FOLDER
	cd $FOLDER
	local GITUSER=$1;
	local PAGE=1; 
	curl "https://api.github.com/users/$GITUSER/repos?page=$PAGE&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
}

#from https://gitlab.com/metalx1000/MyBin/blob/master/linux/shell/get_github.sh
gitbkpuser2(){
	if [ $# -lt 1 ]
		then
		echo "Useage: $0 <user>"
		echo "Example: $0 metalx1000"
	else
		tmp="github_backup"
		mkdir "$tmp"
		cd "$tmp"

		user=$1
		#user=freddii
		wget "https://github.com/$user?tab=repositories" -q -O-|\
		grep "href" -o |\
		grep "$user" -o |\
		grep "Forks" -o |\
		cut -d\" -f4|\
		cut -d\/ -f3|while read line;
		do
		git clone "https://github.com/$user/${line}.git"
		done
    	zip -r ../github_backup_$(date +%Y-%m-%d_%H-%M).zip *
    	#$(date +%s)
    	cd ../
    	rm -fr "$tmp"
	fi
}

dic(){
	curl -s "dict.org/d:$1"
}

#mkvmerge -o outfile.mkv infile_01.mp4 \+ infile_02.mp4 \+ infile_03.mp4

listenmic(){
	pactl load-module module-loopback latency_msec=1
}

listenmicstop(){
	pactl unload-module module-loopback
}

#usage: playproxy http://www.dradio.de/streaming/dkultur.m3u
playproxy(){
	local proxyurl="http://"$(wget --quiet -U "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)" "https://hidemy.name/de/proxy-list/?maxtime=1500&type=h&anon=4#list" -O - | egrep '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}</td><td>[0-9]{1,4}' -o | head -1 | sed 's|</td><td>|:|g')
	echo "your proxyurl is: "$proxyurl
	mpv --stream-lavf-o-append=http_proxy=$proxyurl "$1"
}

dirvirtualenv(){
	dpkg -l | grep -qw virtualenv || sudo apt-get install virtualenv -y
	# 2. Create a directory (name it .venv or whatever name your want) for your new shiny isolated environment.
	virtualenv venv
	# 3. source virtual bin
	source venv/bin/activate
	# 4. you can check check if you are now inside a sandbox.
	#type pip
	# 5. Now you can install your pip package, here requirements.txt is simply a txt file containing all the packages you want. (e.g tornado==4.5.3).
	#pip install -r requirements.txt
}

#twdr2(){ #sudo apt install tor
#	torify mpv http://wdr-wdr2-rheinland.icecast.wdr.de/wdr/wdr2/rheinland/mp3/128/stream.mp3
#}

function run(){
	xdg-open $(find /usr/share/applications/ -type f | fzy);
}

function runlocal(){
	xdg-open $(find /home/$USER/.local/share/applications/ -type f | fzy);
}

function cpuusage(){
	local NUMCPUS=`grep ^proc /proc/cpuinfo | wc -l`; local FIRST=`cat /proc/stat | awk '/^cpu / {print $5}'`; sleep 1; local SECOND=`cat /proc/stat | awk '/^cpu / {print $5}'`; USED=`echo 2 k 100 $SECOND $FIRST - $NUMCPUS / - p | dc`; echo ${USED}% CPU Usage
}

## Anything in /tmp can be deleted any time, as long as it is not accessed.
## This script deletes any file (no folders) that has not been accessed for over 10 days.
function clean_tmp_folder(){
	sudo find /tmp -type f -atime +10 -delete
}

#based on https://github.com/braindef/installation-scripts/blob/master/other/tagebuchOneLiner.txt
function diary(){
	if [ -f ~/.diary.txt ]; then
		echo " " >>~/.diary.txt && echo " " >>~/.diary.txt
	fi
	echo "---------------------------" >>~/.diary.txt && date >>~/.diary.txt && echo "---------------------------" >>~/.diary.txt && nano +10000000 ~/.diary.txt
}

function wav2mp3(){
	# got it from https://github.com/braindef/installation-scripts/
	for i in *.wav; do lame -b 320 -h "${i}" "${i%.wav}.mp3" & done
}

#https://github.com/ilnanny
#http://www.emojipc.com
function emoji-people(){
	echo "people:"
	echo "😀 😃 😄 😁 😆 😅 😂 🤣 ☺️ 😊 😇 🙂 🙃 😉 😌 😍 😘 😗 😙 😚 😋 😜 😝 😛 🤑 🤗 🤓 😎 🤡 🤠"
	echo "😏 😒 😞 😔 😟 😕 🙁 ☹️ 😣 😖 😫 😩 😤 😠 😡 😶 😐 😑 😯 😦 😧 😮 😲 😵 😳 😱 😨 😰 😢 😥"
	echo "🤤 😭 😓 😪 😴 🙄 🤔 🤥 😬 🤐 🤢 🤧 😷 🤒 🤕 😈 👿 👹 👺 💩 👻 💀 ☠️ 👽 👾 🤖 🎃 😺 😸 😹"
	echo "😻 😼 😽 🙀 😿 😾 👐 🙌 👏 🙏 🤝 👍 👎 👊 ✊ 🤛 🤜 🤞 ✌️ 🤘 👌 👈 👉 👆 👇 ☝️ ✋ 🤚 🖐 🖖"
	echo "👋 🤙 💪 🖕 ✍️ 🤳 💅 🖖 💄 💋 👄 👅 👂 👃 👣 👁 👀 🗣 👤 👥 👶 👦 👧 👨 👩 👱‍♀️ 👱 👴 👵 👲"
	echo "👳‍♀️ 👳 👮‍♀️ 👮 👷‍♀️ 👷 💂‍♀️ 💂 🕵️‍♀️ 🕵️ 👩‍⚕️ 👨‍⚕️ 👩‍🌾 👨‍🌾 👩‍🍳 👨‍🍳 👩‍🎓 👨‍🎓 👩‍🎤 👨‍🎤 👩‍🏫 👨‍🏫 👩‍🏭 👨‍🏭 👩‍💻 👨‍💻 👩‍💼 👨‍💼 👩‍🔧 👨‍🔧"
	echo "👩‍🔬 👨‍🔬 👩‍🎨 👨‍🎨 👩‍🚒 👨‍🚒 👩‍✈️ 👨‍✈️ 👩‍🚀 👨‍🚀 👩‍⚖️ 👨‍⚖️ 🤶 🎅 👸 🤴 👰 🤵 👼 🤰 🙇‍♀️ 🙇 💁 💁‍♂️ 🙅 🙅‍♂️ 🙆 🙆‍♂️ 🙋 🙋‍♂️"
	echo "🤦‍♀️ 🤦‍♂️ 🤷‍♀️ 🤷‍♂️ 🙎 🙎‍♂️ 🙍 🙍‍♂️ 💇 💇‍♂️ 💆 💆‍♂️ 🕴 💃 🕺 👯 👯‍♂️ 🚶‍♀️ 🚶 🏃‍♀️ 🏃 👫 👭 👬 💑 👩‍❤️‍👩 👨‍❤️‍👨 💏 👩‍❤️‍💋‍👩 👨‍❤️‍💋‍👨"
	echo "👪 👨‍👩‍👧 👨‍👩‍👧‍👦 👨‍👩‍👦‍👦 👨‍👩‍👧‍👧 👩‍👩‍👦 👩‍👩‍👧 👩‍👩‍👧‍👦 👩‍👩‍👦‍👦 👩‍👩‍👧‍👧 👨‍👨‍👦 👨‍👨‍👧 👨‍👨‍👧‍👦 👨‍👨‍👦‍👦 👨‍👨‍👧‍👧 👩‍👦 👩‍👧 👩‍👧‍👦 👩‍👦‍👦 👩‍👧‍👧 👨‍👦 👨‍👧 👨‍👧‍👦 👨‍👦‍👦 👨‍👧‍👧 👚 👕 👖 👔 👗"
	echo "👙 👘 👠 👡 👢 👞 👟 👒 🎩 🎓 👑 ⛑ 🎒 👝 👛 👜 💼 👓 🕶 🌂 ☂️"
	echo " "
}

function emoji-food(){
	echo "food:"
	echo "🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🥝 🥑 🍅 🍆 🥒 🥕 🌽 🌶 🥔 🍠 🌰 🥜 🍯 🥐 🍞 🥖 🧀"
	echo "🥚 🍳 🥓 🥞 🍤 🍗 🍖 🍕 🌭 🍔 🍟 🥙 🌮 🌯 🥗 🥘 🍝 🍜 🍲 🍥 🍣 🍱 🍛 🍚 🍙 🍘 🍢 🍡 🍧 🍨"
	echo "🍦 🍰 🎂 🍮 🍭 🍬 🍫 🍿 🍩 🍪 🥛 🍼 ☕️ 🍵 🍶 🍺 🍻 🥂 🍷 🥃 🍸 🍹 🍾 🥄 🍴 🍽"
	echo " "
}

function emoji-activity(){
	echo "activity:"
	echo "⚽️ 🏀 🏈 ⚾️ 🎾 🏐 🏉 🎱 🏓 🏸 🥅 🏒 🏑 🏏 ⛳️ 🏹 🎣 🥊 🥋 ⛸ 🎿 ⛷ 🏂 🏋️‍♀️ 🏋️ 🤺 🤼‍♀️ 🤼‍♂️ 🤸‍♀️ 🤸‍♂️"
	echo "⛹️‍♀️ ⛹️ 🤾‍♀️ 🤾‍♂️ 🏌️‍♀️ 🏌️ 🏄‍♀️ 🏄 🏊‍♀️ 🏊 🤽‍♀️ 🤽‍♂️ 🚣‍♀️ 🚣 🏇 🚴‍♀️ 🚴 🚵‍♀️ 🚵 🎽 🏅 🎖 🥇 🥈 🥉 🏆 🏵 🎗 🎫 🎟 🎪"
	echo "🤹‍♀️ 🤹‍♂️ 🎭 🎨 🎬 🎤 🎧 🎼 🎹 🥁 🎷 🎺 🎸 🎻 🎲 🎯 🎳 🎮 🎰"
	echo " "
}

function emoji-animals(){
	echo "animals:"
	echo "🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐽 🐸 🐵 🙊 🙉 🙊 🐒 🐔 🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉 🦇 🐺"
	echo "🐗 🐴 🦄 🐝 🐛 🦋 🐌 🐚 🐞 🐜 🕷 🕸 🐢 🐍 🦎 🦂 🦀 🦑 🐙 🦐 🐠 🐟 🐡 🐬 🦈 🐳 🐋 🐊 🐆 🐅 🐃"
	echo "🐂 🐄 🦌 🐪 🐫 🐘 🦏 🦍 🐎 🐖 🐐 🐏 🐑 🐕 🐩 🐈 🐓 🦃 🦍 🦊 🦌 🦏 🦇 🦅 🦆 🦉 🦎 🦈 🦐 🦑 🦋"
	echo " "
}

function emoji-nature(){
	echo "nature:"
	echo "🌵 🎄 🌲 🌳 🌴 🌱 🌿 ☘️ 🍀 🎍 🎋 🍃 🍂 🍁 🍄 🌾 💐 🌷 🌹 🥀 🌻 🌼 🌸 🌺 🌎 🌍 🌏 🌕 🌖 🌗"
	echo "🌘 🌑 🌒 🌓 🌔 🌚 🌝 🌞 🌛 🌜 🌙 💫 ⭐️ 🌟 ✨ ⚡️ 🔥 💥 ☄️ ☀️ 🌤 ⛅️ 🌥 🌦 🌈 ☁️ 🌧 ⛈ 🌩 🌨 "
	echo "☃️ ⛄️ ❄️ 🌬 💨 🌪 🌫 🌊 💧 💦 ☔️"
	echo " "
}

function emoji-vehicles(){
	echo "vehicles:"
	echo "🚗 🚕 🚙 🚌 🚎 🏎 🚓 🚑 🚒 🚐 🚚 🚛 🚜 🛴 🚲 🛵 🏍 🚨 🚔 🚍 🚘 🚖 🚡 🚠 🚟 🚃 🚋 🚞 🚝 🚄"
	echo "🚅 🚈 🚂 🚆 🚇 🚊 🚉 🚁 🛩 ✈️ 🛫 🛬 🚀 🛰 💺 🛶 ⛵️ 🛥 🚤 🛳"
	echo " "
}

function emoji-objects(){
	echo "objects:"
	echo "⌚️ 📱 📲 💻 ⌨️ 🖥 🖨 🖱 🖲 🕹 🗜 💽 💾 💿 📀 📼 📷 📸 📹 🎥 📽 🎞 📞 ☎️ 📟 📠 📺 📻 🎙 🎚"
	echo "🎛 ⏱ ⏲ ⏰ 🕰 ⌛️ ⏳ 📡 🔋 🔌 💡 🔦 🕯 🗑 🛢 💸 💵 💴 💶 💷 💰 💳 💎 ⚖️ 🔧 🔨 ⚒ 🛠 ⛏ 🔩"
	echo "⚙️ ⛓ 🔫 💣 🔪 🗡 ⚔️ 🛡 🚬 ⚰️ ⚱️ 🏺 🔮 📿 💈 ⚗️ 🔭 🔬 🕳 💊 💉 🌡 🚽 🚰 🚿 🛁 🛀 🛎 🔑 🗝"
	echo "🚪 🛋 🛏 🛌 🖼 🛍 🛒 🎁 🎈 🎏 🎀 🎊 🎉 🎎 🏮 🎐 ✉️ 📩 📨 📧 💌 📥 📤 📦 🏷 📪 📫 📬 📭"
	echo "📮 📯 📜 📃 📄 📑 📊 📈 📉 🗒 🗓 📆 📅 📇 🗃 🗳 🗄 📋 📁 📂 🗂 🗞 📰 📓 📔 📒 📕 📗 📘 📙"
	echo "📚 📖 🔖 🔗 📎 🖇 📐 📏 📌 📍 📌 🎌 🏳️ 🏴 🏁 🏳️‍🌈 ✂️ 🖊 🖋 ✒️ 🖌 🖍 📝 ✏️ 🔍 🔎 🔏 🔐 🔒 🔓"
	echo " "
}
function emoji-symbols(){
	echo "symbols:"
	echo "❤️ 💛 💚 💙 💜 🖤 💔 ❣️ 💕 💞 💓 💗 💖 💘 💝 💟 ☮️ ✝️ ☪️ 🕉 ☸️ ✡️ 🔯 🕎 ☯️ ☦️ 🛐 ⛎ ♈️ ♉️"
	echo "♊️ ♋️ ♌️ ♍️ ♎️ ♏️ ♐️ ♑️ ♒️ ♓️ 🆔 ⚛️ 🉑 ☢️ ☣️ 📴 📳 🈶 🈚️ 🈸 🈺 🈷️ ✴️ 🆚 💮 🉐 ㊙️ ㊗️ 🈴 🈵"
	echo "🈹 🈲 🅰️ 🅱️ 🆎 🆑 🅾️ 🆘 ❌ ⭕️ 🛑 ⛔️ 📛 🚫 💯 💢 ♨️ 🚷 🚯 🚳 🚱 🔞 📵 🚭 ❗️ ❕ ❓ ❔ ‼️ ⁉️"
	echo "🔅 🔆 〽️ ⚠️ 🚸 🔱 ⚜️ 🔰 ♻️ ✅ 🈯️ 💹 ❇️ ✳️ ❎ 🌐 💠 Ⓜ️ 🌀 💤 🏧 🚾 ♿️ 🅿️ 🈳 🈂️ 🛂 🛃 🛄 🛅"
	echo "🚹 🚺 🚼 🚻 🚮 🎦 📶 🈁 🔣 ℹ️ 🔤 🔡 🔠 🆖 🆗 🆙 🆒 🆕 🆓 0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟"
	echo "🔢 #️⃣ *️⃣ ▶️ ⏸ ⏯ ⏹ ⏺ ⏭ ⏮ ⏩ ⏪ ⏫ ⏬ ◀️ 🔼 🔽 ➡️ ⬅️ ⬆️ ⬇️ ↗️ ↘️ ↙️ ↖️ ↕️ ↔️ ↪️ ↩️ ⤴️ ⤵️"
	echo "🔀 🔁 🔂 🔄 🔃 🎵 🎶 ➕ ➖ ➗ ✖️ 💲 💱 ™️ ©️ ®️ 〰️ ➰ ➿ 🔚 🔙 🔛 🔝 ✔️ ☑️ 🔘 ⚪️ ⚫️ 🔴 🔵"
	echo "🔺 🔻 🔸 🔹 🔶 🔷 🔳 🔲 ▪️ ▫️ ◾️ ◽️ ◼️ ◻️ ⬛️ ⬜️ 🔈 🔇 🔉 🔊 🔔 🔕 📣 📢 👁‍🗨 💬 💭 🗯 ♠️ ♣️"
	echo "♥️ ♦️ 🃏 🎴 🀄️ 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛 🕜 🕝 🕞 🕟 🕠 🕡 🕢 🕣 🕤 🕥 🕦 🕧"
	echo " "
}

function emoji-all(){
	emoji-people
	emoji-food
	emoji-activity
	emoji-animals
	emoji-nature
	emoji-vehicles
	emoji-objects
	emoji-symbols
}

screencast(){
	local today=`date '+%Y_%m_%d__%H_%M_%S'`;
	local dimensions=$(xrandr | grep '*' | egrep -o '[0-9]{1,6}x[0-9]{1,6}')
	ffmpeg -f x11grab -s $dimensions -i :0.0 $HOME/Videos/screencast$today.mpg
	echo "vlc $HOME/Videos/screencast$today.mpg"
}

scancvt2png(){
	local STR=`date +%s`
	scanimage --mode Color --resolution 150 --progress > ~/Desktop/$STR.pnm
	pnmtopng ~/Desktop/$STR.pnm > ~/Desktop/$STR.png
	rm ~/Desktop/$STR.pnm
}

#http://auto-console.com/questions/5872/mussen-mit-sox-sound-noise-saubern
rm-noise-of-wav(){
	local SOX=/usr/bin/sox

	if [ $# -lt 2 ]; then
		echo "Usage: $0 infile outfile"
		exit 1
	fi

	$SOX $1 -n trim 0 0.5  noiseprof /tmp/newprofile
	$SOX $1 "$2" noisered /tmp/newprofile
	rm -f /tmp/newprofile
}

# listppa Script to get all the PPA installed on a system ready to share for reininstall
# From: http://askubuntu.com/questions/148932/how-can-i-get-a-list-of-all-repositories-and-ppas-from-the-command-line
listppa(){
for APT in `find /etc/apt/ -name \*.list`; do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY ; do
        local USER=`echo $ENTRY | cut -d/ -f4`
        local PPA=`echo $ENTRY | cut -d/ -f5`
        echo sudo apt-add-repository ppa:$USER/$PPA
    done
done
}

explain(){
	w3m "http://explainshell.com/explain?cmd="`echo $@ | tr ' ' '+'}`
}

ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
        	*.deb)       ar x $1		 ;;
      		*.tar.xz)    tar xf $1       ;;
      		*.tar.zst)   unzstd $1       ;;      

            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

if [ -f /home/barney/liquidprompt/liquidprompt ]; then
	source /home/barney/liquidprompt/liquidprompt
fi


function open() {
  xdg-open $@ &
  disown
}

function find-file() {
  local FILE=$(fzf --preview-window=right:60% --preview='bat --color "always" {}')

  if [ ! -z $FILE ]; then
    $EDITOR $FILE
  fi
}

gccd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}