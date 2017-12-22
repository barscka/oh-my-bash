
#!/usr/bin/env bash
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all general BASH aliases
#
#  Sections:
#  1.   Make Terminal Better (remapping defaults and adding functionality)
#  2.   File and Folder Management
#  3.   Searching
#  4.   Process Management
#  5.   Networking
#  6.   System Operations & Information
#  7.   Date & Time Management
#  8.   Web Development
#  9.   <your_section>
#
#  X.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -lAFh'                         # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias nano='nano -W -$'                     # Preferred 'nano' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias dud='du -d 1 -h'                      # Short and human-readable file listing
alias duf='du -sh *'                        # Short and human-readable directory listing
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias h='fc -l 1 | grep $1'                 # h:            Find an executed command in .bash_history
alias src='source ~/.bashrc'                # src:          Reload .bashrc file

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
    alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'


#   -------------------------------
#   2.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numFiles='echo $(ls -1 | wc -l)'       # numFiles:     Count of non-hidden files in current dir
alias make1mb='truncate -s 1m ./1MB.dat'     # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='truncate -s 5m ./5MB.dat'     # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='truncate -s 10m ./10MB.dat'  # make10mb:     Creates a file of 10mb size (all zeros)


#   ---------------------------
#   3.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file


#   ---------------------------
#   4.  PROCESS MANAGEMENT
#   ---------------------------

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"


#   ---------------------------
#   5.  NETWORKING
#   ---------------------------

alias netCons='lsof -i'                                   # netCons:      Show all open TCP/IP sockets
alias lsock='sudo /usr/sbin/lsof -i -P'                   # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'         # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'         # lsockT:       Display only open TCP sockets
alias ipInfo0='ifconfig getpacket en0'                    # ipInfo0:      Get info on connections for en0
alias ipInfo1='ifconfig getpacket en1'                    # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'              # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                        # showBlocked:  All ipfw rules inc/ blocked IPs


#   ---------------------------------------
#   6.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user
alias perm='stat --printf "%a %n \n "'      # perm:             Show permission of target in number
alias 000='chmod 000'                       # ---------- (no fucking permissions)
alias 640='chmod 640'                       # -rw-r----- (user: rw, group: r, other: -)
alias 644='chmod 644'                       # -rw-r--r-- (user: rw, group: r, other: -)
alias 755='chmod 755'                       # -rwxr-xr-x (user: rwx, group: rx, other: x)
alias 775='chmod 775'                       # -rwxrwxr-x (user: rwx, group: rwx, other: rx)
alias mx='chmod a+x'                        # ---x--x--x (user: --x, group: --x, other: --x)
alias ux='chmod u+x'                        # ---x------ (user: --x, group: -, other: -)


#   ---------------------------------------
#   7.  DATE & TIME MANAGEMENT
#   ---------------------------------------

alias bdate="date '+%a, %b %d %Y %T %Z'"
alias cal='cal -3'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'
alias epochtime='date +%s'
alias mytime='date +%H:%M:%S'
alias secconvert='date -d@1234567890'
alias stamp='date "+%Y%m%d%a%H%M"'
alias timestamp='date "+%Y%m%dT%H%M%S"'
alias today='date +"%A, %B %-d, %Y"'
alias weeknum='date +%V'


#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:       Shows apache error logs

#   ---------------------------------------
#   9.  REMINDERS & NOTES
#   ---------------------------------------

#Comandos do centos
#alias yum='sudo yum'
#alias update='sudo yum update'
#alias upgrade='sudo yum upgrade'
############################################
#Openmandriva comandos 
#alias rpm='sudo rpm'
#alias urpmi='sudo urpmi'
#alias urpme='sudo urpme'
# comandos para atualizar
#alias update='sudo urpmi --auto-select --auto-update'
############################################
#Opensuse comandos
#alias zypper="sudo zypper"
# comandos para atualizar
#alias update="sudo zypper up"
#alias refresh="sudo zypper ref"
############################################
# comandos de distros Debian/Ubuntu e derivados #
# instalar via apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
alias refresh="sudo apt-get update"
alias dpkg='sudo dpkg'
alias reparar="sudo apt-get -f install"
#p comando para atualizar
alias update='sudo apt-get update && sudo apt-get upgrade'
############################################
alias reboot="sudo reboot"
alias c="clear"
alias eu="hostname -i | cut -d' ' -f1"
alias meuip="/sbin/ip a | grep inet | cut -d ":" -f 2 | tr -d a-z,A-Z,-"
alias eu="inxi -v 1"
alias ls='ls --color=auto'
# ver meus hosts em /etc/hosts
alias hosts='cat /etc/hosts'
#gerenciar servicos com sudo
alias service='sudo /usr/sbin/service'
alias systemctl='sudo /bin/systemctl'
#docker comandos
alias dls="docker images"
alias dps="docker ps"
alias drm="docker rm"
alias drmi="docker rmi -f"
#comandos para compactar e extrair arquivos
alias targz="tar -czvf"
alias untar="tar xvzf"
alias ungz2="tar xvjf"
# comandos curtos#
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime='now'
alias nowdate='date +"%d-%m-%Y"'
alias vi='vim'
alias svim='sudo vim'
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias abrir="vim"
alias ports='netstat -tulanp'
alias ebash="vim ~/.bashrc"
alias du="du -hs"
#lias listar='ls -lh | awk '{print $9" "$5}''
## atalho para o iptables#
alias ipt='sudo /sbin/iptables'
 
# visualizar regras do iptables #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall='iptlist'
# obter cabecalho de site #
alias header='curl -I' 
# verificar se o site suporta mod_deflate para compressao gzip
alias headerc='curl -I --compress'
# confirmacao #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
# tornar-se root #
alias root='sudo -i'
#alias su='sudo -i'
# informacao de memoria ## 
alias meminfo='free -m -l -t'

## ver os processos comilao de memoria, como google chrome
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias psaux='ps aux | grep '
## ver os processos comilao de cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
## Ver informacao do processador ##
alias cpuinfo='lscpu'
## sistemas mais antigos/proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
## Ver informacao do GPU do desktop / laptop## 
#alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
#comandos complementares
alias teste='ping 8.8.8.8'
alias br='localectl set-keymap pt_br pt_br'
alias us='localectl set-keymap us us'
alias ru='setxbmap ru'
alias я='setxkbmap br'
#django atalho
alias pymanage="./manage.py"
#alias pip='sudo pip'
alias pyrunserver="./manage.py runserver"
alias pymakemigrations='./manage.py makemigrations'
alias pymigrate='./manage.py migrate'
alias pyapp='python manage.py startapp'
alias djangoecommerce='source activate djangoecommerce'
alias cooplinha='source activate cooplinha'
alias miniprompt='PS1="(`basename \"$VIRTUAL_ENV\"`):/\W$ "'
alias coopervap='source activate coopervap'
alias cel='conda env list |grep "*"'
####################################
#kaspersky comandos
alias kesl-control='sudo /opt/kaspersky/kesl/bin/kesl-control'
alias kesl-full='sudo /opt/kaspersky/kesl/bin/kesl-control --start-task 2 --progress'
alias kesl-list='sudo /opt/kaspersky/kesl/bin/kesl-control --get-task-list'
alias kesl-update='sudo /opt/kaspersky/kesl/bin/kesl-control'
alias kesl-file='sudo /opt/kaspersky/kesl/bin/kesl-control --scan-file '
