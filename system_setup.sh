#!/bin/bash
# Run me in following way: `sudo bash script.sh`

echo "@>> You should only run this script on freshly installed system!"

read -p "@>> Do you confirm that its the case? ('YES'): "
if [ $REPLY = "YES" ]; then
  echo "@>> Cool! Starting the script"
else
  echo "@>> Aborting the script"
  exit
fi

# Check prerequisites

wget --quiet --spider http://google.com
if [ $? -eq 0 ]; then
  echo '@>> Internet connection is working, cool!'
else
  echo  "@>> Internet connection is required for the script"
  exit
fi

ls ~/.ssh | grep --silent pub
if [ $? -eq 0 ]; then
    echo "@>> SSH key is present, cool!"
else
    echo "@>> No SSH key is present in ~/.ssh"
    echo "@>> Github SSH key is required for the script"
    exit
fi
