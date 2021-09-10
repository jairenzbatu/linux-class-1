#!/bin/bash

function gradenow {
	clear
	echo "Ensure to run the script with sudo under your own account. Press enter to continue."
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

function fourone {
	activity="41"

	priv=$(groups ${current_user} | grep -oE wheel)
	passset=$(sudo cat /etc/shadow | grep ${current_user})
	keypair=$(ls /home/${current_user}/.ssh/)
	

	## OUTPUT TEMPLATE
	output="${current_user:-default}•${priv:-default}•${passset:-default}•${keypair:-default}"

	## ENCRYPTION TEMPLATE
	enc=$(echo ${output} | base64 -w 0)
	tag_value=$(cat /home/${current_user}/.${activity} | base64 -w 0)

	clear
	echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
	echo "${tag_value}-_-${enc}"
	echo -e "\n \n \n"

	#tag VM as scored
	echo "${current_user}_${activity}" >> /home/${current_user}/.${activity} 
}

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
	echo "Please Run this Script Using a NON-ROOT Account"
else
	gradenow
	fourone
fi

