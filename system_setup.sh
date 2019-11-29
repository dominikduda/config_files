(

# copy whole file and paste it into terminal

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

sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
ssh-add

echo "@>> Updating kernel"

# this did not work last time
sudo apt-add-repository ppa:teejee2008/ppa -y
sudo apt-get --assume-yes install ukuu
sudo ukuu --yes --install v5.1.21
sudo apt --assume-yes autoremove ukuu

echo "@>> Installing nvidia driver"

sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt --assume-yes install nvidia-driver-435 nvidia-settings

echo "@>> Installing NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
source ~/.bashrc
nvm install node
source ~/.bashrc

echo "@>> Installing and setting up git"

sudo apt --assume-yes install git
npm install -g diff-so-fancy
mkdir ~/github
mkdir ~/github/config_files
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:dominikduda/config_files.git ~/github/config_files
cp ~/github/config_files/.gitconfig ~/.gitconfig

echo "@>> configure system"

gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

sudo apt install tmux
# finish nvim setup
sudo add-apt-repository ppa:neovim-ppa/unstable -y

source ~/.bashrc

)
