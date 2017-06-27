#!/bin/sh
EMAIL=john.do@yopmail.com
free -m | grep Mem | while read output;
do
 swap=$(echo $output | awk '{print $2}' )
 used=$(echo $output | awk '{ print $3 }' )
 freed=$(echo $output | awk '{ print $4 }' )
 echo "Swap : $swap"
 echo "Used : $used"
 echo "Free : $freed"
 usep=`expr $used \* 100 / $swap`
 echo $usep
 if [ $usep -ge 80 ]; then
   echo "Mem Usage Alert Total Mem: \"$swap\" Used: \"$used ($usep%)\" Free:
\"$freed\" on $(hostname) as on $(date)" |
    mail -s "Alert SEM : Mem Usage $usep%" "${EMAIL}"
 fi
done
