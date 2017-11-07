#!/bin/bash

if [ "$#" -eq 2 ] && [ "$1" == "discovery" ]
then
  echo "executing => iscsiadm --mode discovery --type sendtargets --portal $2"
  iscsiadm --mode discovery --type sendtargets --portal $2
  exit
fi

if [ "$#" -eq 3 ] && [ "$1" == "connect" ]
then
  echo "executing => iscsiadm --mode node --targetname $2 --portal $3 --login"
  iscsiadm --mode node --targetname $2 --portal $3 --login
  exit
fi

if [ "$#" -eq 1 ] && [ "$1" == "disconnect" ]
then
  echo "executing => iscsiadm --mode node -u"
  iscsiadm --mode node -u
  exit
fi

echo "usage:"
echo "$0 discovery \$target_ip"
echo "$0 connect \$target_name \$target_ip_port"
echo "$0 disconnect"
