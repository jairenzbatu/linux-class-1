#!/bin/bash

#part 1
private_key=$(ls /root/.ssh/id_rsa | wc -l)
authorized_key=$(cat /root/.ssh/authorized_keys | wc -m)

clear
#part 2
echo "Please Input Your Last Name without spaces and small caps."
read last_name

folder_name=$(ls /opt/ | grep ${last_name})
file_name=$(ls -l /opt/${folder_name} | grep 'assignment_21' | wc -l)
github_uname=$(cat /opt/${folder_name}/assignment_21)
backup_file=$(cat /opt/${folder_name}/six/two/assignment_21.bak)
sub_dir=$(ls -l /opt/${folder_name}/ | grep '^d' | awk '{print $9}' | tr '\n' ' ')
list_all=$(cat /root/.bash_history | grep "ls -la" | wc -l)
dir_two=$(ls -l /opt/${folder_name}/six/ | grep 'two' | wc -l)


output="'${private_key}','${authorized_key}','${folder_name}','${file_name}','${github_uname}','${backup_file}','${sub_dir}','${list_all}','${dir_two}'"


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
tag_value=$(cat /var/.21 | base64 -w 0)


clear
echo -e "\n\nPlease Copy and Paste the code below to MyClass.\n"
echo "${tag_value}-_-${enc}"
echo -e "\n \n \n"


#tag VM as scored
echo "${last_name}_assignment21" >> /var/.21