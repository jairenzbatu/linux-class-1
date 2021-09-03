#!/bin/bash


clear
echo "Please Input Interface Name"
read int_name

clear
echo "Please Input Your Last Name without spaces and small caps."
read last_name

network=$(cat /etc/sysconfig/network-scripts/ifcfg-${int_name})
vi_commands=$(cat /root/.bash_history | grep "vi")

#generate repo list
rm -f > /tmp/epel
yum repolist > /tmp/epel
epel_check=$(cat /tmp/epel | grep epel)


output="${network}•${vi_commands}•${epel_check}"


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


enc=$(echo ${output} | base64 -w 0)
tag_value=$(cat /var/.31 | base64 -w 0)


clear
echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
echo "${tag_value}-_-${enc}"
echo -e "\n \n \n"


#tag VM as scored
echo "${last_name}_assignment31" >> /var/.31