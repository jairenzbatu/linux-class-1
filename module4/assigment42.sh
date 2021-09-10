#!/bin/bash

function gradenow {
	clear
	echo "Ensure to run the script as ROOT. Press enter to continue."
	read test

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "#           Scoring Assignment              #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 20 % .......                              #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 46 % ............                         #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 70 % .........................            #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 95 % .................................    #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1
}

function checker {
	activity="42"

	# password settings
	phil_pass=$(sudo cat /etc/shadow | grep phil)
	gel_pass=$(sudo cat /etc/shadow | grep gel)

	# group configs
	phil_groups=$(groups phil)
	gel_groups=$(groups gel)

	# folder permissions
	f_atlas=$(ls -l /opt/ | grep atlas)
	f_devs=$(ls -l /opt/atlas | grep devs)
	f_fina=$(ls -l /opt/atlas | grep finance)

	# file permissions
	f_hello=$(ls -l /opt/atlas/devs)

	# PHIL PERMISSION TESTS
	#permission 1
	su - phil -c "touch /opt/atlas/phil_1"
	phil_1=$(su - phil -c "ls -l /opt/atlas | grep phil_1")
	rm -f /opt/atlas/phil_1

	#permission 2
	su - phil -c "touch /opt/atlas/devs/phil_2"
	phil_2=$(su - phil -c "ls -l /opt/atlas/devs | grep phil_2")
	rm -f /opt/atlas/devs/phil_2

	#permission 3
	su - phil -c "touch /opt/atlas/finance/hello 2> /tmp/phil_3"
	phil_3=$(cat /tmp/phil_3)
	rm -f /tmp/phil_3

	# permission 4
	phil_4=$(su - phil -c "ls -l /opt/atlas/finance/")

	# GEL PERMISSIONS TESTS
	#permission 1
	su - gel -c "touch /opt/atlas/gel_1"
	gel_1=$(su - gel -c "ls -l /opt/atlas | grep gel_1")
	rm -f /opt/atlas/gel_1

	#permission 2
	su - gel -c "touch /opt/atlas/finance/gel_2"
	gel_2=$(su - gel -c "ls -l /opt/atlas/finance | grep gel_2")
	rm -f /opt/atlas/finance/gel_2

	#permission 3
	su - gel -c "touch /opt/atlas/devs/hello 2> /tmp/gel_3"
	gel_3=$(cat /tmp/gel_3)
	rm -f /tmp/gel_3

	# permission 4
	su - gel -c "ls -l /opt/atlas/devs 2> /tmp/gel_4"
	gel_4=$(cat /tmp/gel_4)
	rm -f /tmp/gel_4
	

	## OUTPUT TEMPLATE
	output="${phil_pass:-XYX}•${gel_pass:-XYX}•${phil_groups:-XYX}•${gel_groups:-XYX}•${f_atlas:-XYX}•${f_devs:-XYX}•${f_fina:-XYX}•${f_hello:-XYX}•${phil_1:-XYX}•${phil_2:-XYX}•${phil_3:-XYX}•${phil_4:-XYX}•${gel_1:-XYX}•${gel_2:-XYX}•${gel_3:-XYX}•${gel_4:-XYX}"

	## ENCRYPTION TEMPLATE
	enc=$(echo ${output} | base64 -w 0)
	tag_value=$(cat ~/.${activity} | base64 -w 0)

	clear
	echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
	echo "${tag_value}-_-${enc}"
	echo -e "\n \n \n"

	#tag VM as scored
	echo "${current_user}_${activity}" >> ~/.${activity}
}

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
	gradenow
	checker
else
	echo "Please Run this Script Using a ROOT Account"
fi