#!/bin/bash


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

echo -e "1. $gel_1\n2. $gel_2\n3. $gel_3\n4. $gel_4"
