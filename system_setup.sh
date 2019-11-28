#!/bin/bash
# Run me in following way: `sudo bash script.sh`

echo "@>> You should only run this script on freshly installed system!"
read -p "@>> Do you confirm that this is the case? ('YES'): "
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

ls ~/.ssh | grep --silent id_rsa
if [ $? -eq 0 ]; then
    echo "@>> SSH key is present, cool!"
else
    echo "@>> No SSH key is present in ~/.ssh"
    echo "@>> Github SSH key is required for the script"
    exit
fi

echo "@>> Setup SSH keys"

chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub
ssh-agent -s
ssh-add

echo "@>> Updating kernel"

apt-add-repository ppa:teejee2008/ppa -y
apt-get --assume-yes install ukuu
ukuu --yes --install v5.4
ukuu --yes --purge-old-kernels
apt --assume-yes autoremove ukuu

echo "@>> Installing nvidia driver"

add-apt-repository ppa:graphics-drivers/ppa -y
apt --assume-yes install nvidia-driver-435 nvidia-settings

echo "@>> Installing NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
source ~/.bashrc
nvm install node

echo "@>> Installing and setting up git"

apt --assume-yes install git
npm install -g diff-so-fancy
mkdir ~/github
mkdir ~/github/config_files
git clone https://github.com/dominikduda/config_files.git ~/github/config_files
cp ~/github/config_files/.gitconfig ~/.gitconfig
