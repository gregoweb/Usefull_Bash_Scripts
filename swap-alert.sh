#!/bin/sh
EMAIL=john.do@yopmail.com
free -m | grep Swap | while read output;
do
 swap=$(echo $output | awk '{print $2}' )
 used=$(echo $output | awk '{ print $3 }' )
 freed=$(echo $output | awk '{ print $4 }' )
 echo "Swap : $swap"
 echo "Used : $used"
 echo "Free : $freed"
 usep=`expr $used \* 100 / $swap`
 echo $usep
 if [ $usep -ge 1 ]; then
   echo "Swap Usage Alert Total Swap: \"$swap\" Used: \"$used ($usep%)\" Free:
\"$freed\" on $(hostname) as on $(date)" |
    mail -s "Alert SEM : Swap Usage space $usep%" "${EMAIL}"
 fi
done
