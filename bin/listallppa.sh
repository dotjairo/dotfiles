#! /bin/sh
# Script to get all the PPA installed on a system
# Found on http://askubuntu.com/a/148968
for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        ##echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo ppa:$USER/$PPA
        #else
        #    echo \'${ENTRY}\'
        fi
    done
done
