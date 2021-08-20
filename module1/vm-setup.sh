#!/bin/bash

echo "Please input your Host IP"
read vm_input
ip_detect=$(hostname -I)

#Splitted IP
octet_input=${vm_input%.*}
octet_detect=${ip_detect%.*}

#output
# echo "IP Input: ${octet_input}"
# echo "IP Detect: ${octet_detect}"

if [[ ${octet_detect} == ${octet_input} ]]; then
	echo "IP Is Within Range"
else
	echo "IP Not Within Range."
	echo "Your IP is ${ip_detect}"
	echo "While Host IP is ${vm_input}"
fi