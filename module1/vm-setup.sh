#!/bin/bash
clear
echo "Please input your Host IP"
read vm_input
ip_detect=$(hostname -I)

#Splitted IP
octet_input=${vm_input%.*}
octet_detect=${ip_detect%.*}

#colors
RED='\033[0;31m'
NC='\033[0m' # No Color

#output
# echo "IP Input: ${octet_input}"
# echo "IP Detect: ${octet_detect}"

if [[ ${octet_detect} == ${octet_input} ]]; then
	clear
	echo "#############################################"
	echo "#                                           #"
	echo "#           IP Is Within Range              #"
	echo "#                                           #"
	echo "#############################################"

else
	clear
	echo "#############################################"
	echo "#                                           #"
	echo "#           IP Not Within Range             #"
	echo "#                                           #"
	echo "#############################################"
	echo ""
	echo -e "Your IP is: ${RED} ${ip_detect} ${NC}"
	echo -e "While Host IP is:${RED} ${vm_input} ${NC}"
	echo ""
fi