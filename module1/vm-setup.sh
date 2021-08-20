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
	network="pass"
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
	network="fail"
fi

#specs
hdd=$(df -h / | tail -1 | awk '{print $2}')
memory=$(free -m | grep "Mem:" | awk '{print $2}')
version=$(cat /etc/centos-release)
mac=$(find /sys/class/net -mindepth 1 -maxdepth 1 ! -name lo -printf "%P: " -execdir cat {}/address \;)

echo "Enter 'Y' to Grade your Assignment..."
read test

if [[ ${test} == "Y" ]]; then
	clear
	summary="System Specs \n >> Network: ${network} - ${ip_detect} \n >> Disk Space: ${hdd} \n >> Memory: ${memory} \n >> Linux Version: ${version} \n >> MAC: ${mac}"
	echo -e ${summary}
	echo -e "\n\n Please Copy and Paste the code below to Canvas.\n"
	echo ${summary} | base64 -w 0
	echo -e "\n"
fi