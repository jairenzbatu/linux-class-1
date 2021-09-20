#!/bin/bash

function gradenow {
	clear
	echo "Ensure to run the script as ROOT. Press enter to continue."
	read test

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "#           Scoring Assignment              #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 20 % .......                              #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 46 % ............                         #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 70 % .........................            #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 95 % .................................    #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1
}

function checker {
	activity="midterm"
	def_folder="/opt/.second"

	# create default folder
	mkdir -p ${def_folder}

	# check values
	s_std_number=$(cat ${def_folder}/std_number)
	s_first_name=$(cat ${def_folder}/first_name)
	s_last_name=$(cat ${def_folder}/last_name)

	clear

	if [[ ${s_std_number} == "" ]]; then
		echo "1. Please input your student number."
		read std_number
		echo ${std_number} > ${def_folder}/std_number
	fi


	if [[ ${s_first_name} == "" ]]; then
		echo "2. Please enter your first name (small caps without spaces)."
		read first_name
		echo ${first_name} >> ${def_folder}/first_name
	fi

	if [[ ${s_last_name} == "" ]]; then
		echo "3. Please enter your last name (small caps without spaces)."
		read last_name
		echo ${last_name} >> ${def_folder}/last_name
	fi

	clear
	echo "Checking Network Configurations"
	echo "4. Please enter your network interface name."
	read network_int
	echo ${network_int} >> ${def_folder}/network_int
	
	network_file="/etc/sysconfig/network-scripts/ifcfg-${network_int}"
	network_config=$(cat ${network_file})

	if [[ $network_config == "" ]]; then
		echo "Network interface do not exist, please rerun the script and input again."
	else
		#remove bootproto
		sed -i '/BOOTPROTO/d' ${network_file}

		#remove onboot
		sed -i '/ONBOOT/d' ${network_file}

		#remove dns1
		sed -i '/DNS1/d' ${network_file}

		#remove dns2
		sed -i '/DNS2/d' ${network_file}

		echo "Network Configuration Done.. will continue in 3 seconds..."
		sleep 3
	fi


	clear 
	echo "5. Updating Package Repositories"
	yum remove -y epel-release

	clear
	echo "#############################################"
	echo "                                           "
	echo " Hi ${s_first_name}, your VM is now ready! "
	echo " You can start the exam now. Good Luck!   "
	echo "                                          "
	echo "#############################################"


	
	# ## OUTPUT TEMPLATE
	# output="${phil_pass:-XYX}•${gel_pass:-XYX}•${phil_groups:-XYX}•${gel_groups:-XYX}•${f_atlas:-XYX}•${f_devs:-XYX}•${f_fina:-XYX}•${f_hello:-XYX}•${phil_1:-XYX}•${phil_2:-XYX}•${phil_3:-XYX}•${phil_4:-XYX}•${gel_1:-XYX}•${gel_2:-XYX}•${gel_3:-XYX}•${gel_4:-XYX}"

	# ## ENCRYPTION TEMPLATE
	# enc=$(echo ${output} | base64 -w 0)
	# tag_value=$(cat ~/.${activity} | base64 -w 0)

	# clear
	# echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
	# echo "${tag_value}-_-${enc}"
	# echo -e "\n \n \n"

	# #tag VM as scored
	# echo "${current_user}_${activity}" >> ~/.${activity}
}

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
	gradenow
	checker
else
	echo "Please Run this Script Using a ROOT Account"
fi