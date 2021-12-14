#!/bin/bash

# Description: Script For System Inventory
# Author: ladbam Email: kloversolutions@outlook.com
# Github: https://github.com/ladbam/project.git
# Description: Project [System Inventory]

# Author: ladbam Email: kloversolutions@outlook.com
# Date: Dec 1,2021

#ENV1
# The Iventory Varables
OS=`cat /etc/*release|grep -i id|head -1|awk -F= '{print$2}'`  
VS=`cat /etc/*release|grep -i id | tail -1|awk -F= '{print$2}'`
#VS=`cat /etc/*release||grep -i id|tail -1|awk -F= '{print$2}'`
MS=`cat /proc/meminfo|head -1|awk '{print$2,$3}'`
HD=`lsblk|grep disk|awk '{print$4}'`
CS=`lscpu|grep MHz|awk '{print$3}'`
KV=`uname -r|awk -F- '{print$1}'`
HN=`hostname`
BIT=`arch`
IP=`hostname -I|awk '{print$1}'`        #For Vagrant Modify {print$1 to $2}
##LP=`ss -tulpn|grep LISTEN|awk 'print$1,$@,$4,$5,$7'`  #For Vagrant Exec ss in ENV2
DNS=`cat /etc/resolv.conf|grep name|awk '{print$2}'`
MF=`dmidecode -t system|grep Man|awk '{print$2,$3}'`
VM=`dmidecode|grep Fa|awk '{print$2,$3}'`
MAC=`ip a|grep ether|head -1|awk '{print$2}'`

#ENV2
# Inventory Checklist
        echo "******System Inventory Checklist******"
        sleep 3
echo
# The Operating System and Version
        echo "Checking the Operating system...[OS version]"
        sleep 3
        echo "The OS is ${OS} and the Version is ${VS}"
echo
# Check Memory Size
        echo "Checking the system memory...[memory size]"
        sleep 3
        echo "The memory size is: $MS"
echo
# Check Harddrive Size
echo "Checking the system hard-drive...[hard-drive size]"
        sleep 3
        echo "The hard-drive is: $HD"
echo
# Check CPU Speed
        echo "Checking the CPU processor...[CPU speed]"
        sleep 3
        echo "The MHz/speed is: $CS"
echo
# The Kernel Version
        echo "Checking the system kernel...[kernel version]"
        sleep 3
        echo "The Version is: $KV"
echo
# System Bits
        echo "Checking the system bits...[system bits]"
        sleep 3
        echo "The system bits is: $BIT"
echo

# System Hostname
        echo "Checking the system hostname...[hostname}"
        sleep 3
        echo "The hostname is: $HN"
echo
# The System IP Address
        echo "Checking the system IP address..."
        sleep 3
        echo "The ip address is: $IP"
echo
# The System Open Ports
        echo "Checking opened ports on the system..."
        sleep 3
        echo "The opening ports are:"
        lsof -i -P -n|grep LISTEN|awk '{print$1,$8,$10,$9}'
        ##ss -tulpn|grep LISTEN|awk '{print$1,$2,$5,$7}'
echo
# The System DNS
        echo "Checking the system DNS...."
        sleep 3
        echo "The dns is: $DNS"
echo
# The System Manufacturer
        echo "Checking the system manufacturer...."
        sleep 3
        echo "The manufacturer is: $MF"
echo
# Check Server If Virtual or Physical System
        echo "Checking the server if the system is virtual or physical...."
        sleep 3
        echo "The system is: $VM"
echo
# The System MAC Address
        echo "Checking the system mac address...."
        sleep 3
        echo "The mac address is: $MAC"
echo
echo "**** Inventory Check Completed ****"
echo
#END
