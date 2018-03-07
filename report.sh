#!/bin/bash


# ------------------------------------------
# Report Script Welcome (https://pastebin.com/fNwNSRHi)
# ------------------------------------------
echo 'Report in Team'

while [ "$1" != "" ]; do
    case $1 in
    -h | --help )
			echo 'Can not help you kind sir!'
            exit
            ;;
    init )
			echo 'Init WAU system'
			{ 
				# ON MASTER MUST RUN !!!!
				# nc -k -l 5030 >&2 2>> /opt/telnet.log
				#
				cat /var/lib/tor/hidden_service/hostname > /dev/tcp/${MASTER}/5030	
			} || { 
				echo 'Master Dropped - FallBack mode'
				echo 'Lost WAU soul' > /dev/tcp/ausis.sovas.id.lv/5030
				cat /var/lib/tor/hidden_service/hostname > /dev/tcp/ausis.sovas.id.lv/5030
			}
            exit
            ;;
        * )
            exit 1
    esac
    shift
done