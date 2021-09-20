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

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 20 % .......                              #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 46 % ............                         #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1

	# clear
	# echo "#############################################"
	# echo "#                                           #"
	# echo "# 70 % .........................            #"
	# echo "#                                           #"
	# echo "#############################################"
	# sleep 1

	clear
	echo "#############################################"
	echo "#                                           #"
	echo "# 95 % .................................    #"
	echo "#                                           #"
	echo "#############################################"
	sleep 1
}

function checker {
	activity="m50"
	def_folder="/opt/.second"

	#generate repo list
	rm -f > /tmp/epel
	yum repolist > /tmp/epel
	epel_check=$(cat /tmp/epel | grep -oE "Extra Packages for Enterprise Linux")

	# lastname-firstname
	std_name="$(cat ${def_folder}/last_name)_$(cat ${def_folder}/first_name)"
	
	# network configurations
	network_int=$(cat ${def_folder}/network_int)
	network=$(cat /etc/sysconfig/network-scripts/ifcfg-${network_int})

	# vim usage
	vi_commands=$(cat /root/.bash_history | grep "vi")

	# folder structure and permissions
	f_opt=$(ls -l /opt/)
	f_linux_acad=$(ls -l /opt/linux_academy/)
	f_students=$(ls -l /opt/linux_academy/students/)

	# group creations
	data_groups=$(tail -15 /etc/group)

	# user creations
	data_users=$(tail -15 /etc/passwd)

	# user groups assignment
	u_greg=$(groups greg)
	u_tom=$(groups tom)
	u_rob=$(groups rob)
	u_kass=$(groups kass)
	u_anj=$(groups anj)
	u_claire=$(groups claire)
	u_bob=$(groups bob)
	u_john=$(groups john)

	# password auth
	greg_pass=$(cat /etc/shadow | grep greg)
	tom_pass=$(cat /etc/shadow | grep tom)

	# claire file creation
	claire_file=$(ls -l /opt/linux_academy/students/engineering/)
	c_file_content=$(cat /opt/linux_academy/students/engineering/electronics-engineering.txt)

	# greg file creation
	greg_file=$(ls -l /opt/linux_academy/it_staff/)
	g_file_content=$(cat /opt/linux_academy/it_staff/network-interface)

	# ssh-key pairs
	john_ssh=$(ls -l /home/john/.ssh/)
	john_authkey=$(cat /home/john/.ssh/authorized_keys)

	bob_ssh=$(ls -l /home/bob/.ssh/)
	bob_authkey=$(cat /home/bob/.ssh/authorized_keys)


	## OUTPUT TEMPLATE
	output="${epel_check:-XYX}•${network:-XYX}•${vi_commands:-XYX}•${f_opt:-XYX}•${f_linux_acad:-XYX}•${f_students:-XYX}•${data_groups:-XYX}•${data_users:-XYX}•${u_greg:-XYX}•${u_tom:-XYX}•${u_rob:-XYX}•${u_kass:-XYX}•${u_anj:-XYX}•${u_claire:-XYX}•${u_bob:-XYX}•${u_john:-XYX}•${greg_pass:-XYX}•${tom_pass:-XYX}•${claire_file:-XYX}•${c_file_content:-XYX}•${greg_file:-XYX}•${g_file_content:-XYX}•${john_ssh:-XYX}•${john_authkey:-XYX}•${bob_ssh:-XYX}•${bob_authkey:-XYX}"

	## ENCRYPTION TEMPLATE
	enc=$(echo ${output} | base64 -w 0)
	tag_value=$(cat ~/.${activity:-XYX} | base64 -w 0)

	clear
	echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
	echo "${tag_value}-_-${enc}"
	echo -e "\n \n \n"

	#tag VM as scored
	echo "${std_name}_${activity}" >> ~/.${activity}
}

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
	gradenow
	checker
else
	echo "Please Run this Script Using a ROOT Account"
fi