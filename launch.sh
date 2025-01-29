#!/bin/bash
PS3="Select the Option: "
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
OWhite='\033[47m' 
UYellow='\033[4;33m'
UPurple='\033[4;35m'
MACADDR='40:b8:9a:17:58:77'
BRed='\033[1;31m' 
clear
macchange(){
  		clear	
      echo -e "${GREEN}CHANGING...${NC}"
			sudo ifconfig wlan0 down
			sleep 1.5
			sudo macchanger wlan0 -m $1 > /dev/null	
			sleep 1.5	
			sudo ifconfig wlan0 up
			sudo pkill NetworkManager
			sleep 1
			sudo NetworkManager
			sleep 3
      clear
			ifconfig

}

echo -e "${RED}

     ▗▖  ▗▖ ▗▄▖  ▗▄▄▖     ▗▄▄▖▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖▗▄▄▄▖▗▄▄▖     ▄   ▄ █ 
     ▐▛▚▞▜▌▐▌ ▐▌▐▌       ▐▌   ▐▌ ▐▌▐▌   ▐▛▚▖▐▌▐▌   ▐▌   ▐▌ ▐▌    █   █ █ 
     ▐▌  ▐▌▐▛▀▜▌▐▌       ▐▌   ▐▛▀▜▌▐▛▀▀▘▐▌ ▝▜▌▐▌▝▜▌▐▛▀▀▘▐▛▀▚▖     ▀▄▀  █ 
     ▐▌  ▐▌▐▌ ▐▌▝▚▄▄▖    ▝▚▄▄▖▐▌ ▐▌▐▙▄▄▖▐▌  ▐▌▝▚▄▞▘▐▙▄▄▖▐▌ ▐▌          █ 
${NC}
"

echo -e  "-----------------------------------------------------------------------------------------------"
echo -e "|              ------------------->${UYellow}|1|${NC}${BRed}-SET_RANDOM_MAC-ADDRESS-${NC}                                |"
echo -e "|              ------------------->${UYellow}|2|${NC}${BRed}-SET_CONFIGURED_MAC-ADDRESS-${NC}                            |"
echo -e "|              ---------------------------->${UPurple}|99|${NC}${BRed}-EXIT-${NC}                                        |"
echo -e "-----------------------------------------------------------------------------------------------"
echo -e "--------------------------------[SELECT_OPTION]------------------------------------------------"
while true 
  do 
   read opt 
   if [ $opt -eq 1 ];then 
  
	    clear
      sudo ifconfig wlan0 down
      sleep 1.5
	    sudo macchanger wlan0 -r		
	    sleep 1.5
	    ip=($RANDOM% 255)
	    sudo ifconfig wlan0 $(($RANDOM% 255)) netmask 255.255.255.0
	    sleep 0.5	
	    sudo ifconfig wlan0 up
	    sudo pkill NetworkManager
	    sleep 1
	    sudo NetworkManager
	    sleep 3 
	    ifconfig
      exit
    elif [ $opt -eq 2 ]; then
      macchange ${MACADDR}
      exit
    elif [ $opt -eq 99 ]; then
      clear 
      break 
      exit
     else
       echo -e "${RED}INVALID_OPTION${NC}"
       exit
    fi
  done

