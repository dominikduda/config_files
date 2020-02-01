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

(

touch ~/Desktop/system_setup_logs.txt

echo "@>> Setup SSH keys"

sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
ssh-add

echo "@>> Minimal git setup"

sudo apt-get update
mkdir ~/github
mkdir ~/github/config_files
sudo apt-get --assume-yes install git
ssh-keyscan github.com >> ~/.ssh/known_hosts
git clone git@github.com:dominikduda/config_files.git ~/github/config_files

echo "@>> Updating kernel"

git clone git@github.com:dominikduda/my_kernel.git ~/github/my_kernel
cd ~/github/my_kernel
sudo dpkg -i *
cd

echo "@>> Installing nvidia driver"

sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get --assume-yes install nvidia-driver-435 nvidia-settings

echo "@>> Installing RVM"

sudo apt-get --assume-yes install curl
sudo apt-get --assume-yes install gnupg2
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
  touch ~/.rvm/gemsets/global.gems
  echo "rubocop" >> ~/.rvm/gemsets/global.gems
  echo "neovim" >> ~/.rvm/gemsets/global.gems
rvm install ruby-2.6.5
rvm --default use 2.6.5

echo "@>> Installing NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
source ~/.bashrc
  touch ~/.nvm/default-packages
  echo "eslint" >> ~/.nvm/default-packages
  echo "importjs" >> ~/.nvm/default-packages
  echo "neovim" >> ~/.nvm/default-packages
  echo "diff-so-fancy" >> ~/.nvm/default-packages
  echo "livedown" >> ~/.nvm/default-packages
nvm install node
source ~/.bashrc

echo "@>> Further git setup"

npm install -g diff-so-fancy
cp ~/github/config_files/.gitconfig ~/.gitconfig

echo "@>> Install python"

sudo apt-get --assume-yes install python-dev python-pip python3-dev python3-pip

echo "@>> setup R"

cp ~/github/config_files/.Rprofile ~/.Rprofile
sudo apt-get --assume-yes install libcurl4-openssl-dev
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' -y
sudo apt-get update
sudo apt-get --assume-yes install r-base
pip3 install radian
sudo Rscript -e "install.packages('pacman')"

echo "@>> setup chart wallpaper"

mkdir ~/bin
cp ~/github/config_files/bin/* ~/bin/
sudo curl -L "https://gist.githubusercontent.com/dominikduda/4ebab55329d7e8c9f2cbb05b82202705/raw/72e340bff29c16df0f9378c25bd1debefa35778a/generate_wallpaper.r" -o ~/bin/generate_wallpaper.r
sudo ~/bin/generate_wallpaper.sh
gsettings set org.gnome.desktop.background picture-uri ~/Pictures/wallpaper_chart.png
gsettings set org.gnome.desktop.background picture-options 'stretched'
gsettings set org.gnome.desktop.screensaver picture-uri ~/Pictures/wallpaper_chart.png
gsettings set org.gnome.desktop.screensaver picture-options 'stretched'
touch ~/crontab
echo "@reboot sleep 10; ~/bin/generate_wallpaper.sh" >> ~/crontab
crontab -u dominikduda ~/crontab

echo "@>> setup custom fonts"

mkdir ~/.fonts
cp -a ~/github/config_files/input_font/. ~/.fonts/
fc-cache -f -v

echo "@>> update grub font"

sudo grub-mkfont -s 55 -o /boot/grub/input_for_grub.pf2 ~/github/config_files/input_font/input_regular.ttf
echo "GRUB_FONT=/boot/grub/input_for_grub.pf2" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "@>> setup zsh and oh-my-zsh"

sudo apt-get --assume-yes install zsh

git clone https://github.com/zsh-users/zsh.git ~/Downloads/zsh
cd ~/Downloads/zsh
./Util/preconfig
./configure
make
sudo make install
  sudo ln -s ~/bin/zsh /bin/zsh

echo "n" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
sudo chsh -s /bin/zsh
cp ~/github/config_files/.zshrc ~/.zshrc
cp ~/github/config_files/.oh-my-zsh/themes/thedd.zsh-theme ~/.oh-my-zsh/themes/thedd.zsh-theme

echo "@>> setup tmux"

sudo apt-get --assume-yes install tmux

git clone https://github.com/tmux/tmux.git ~/bin/tmux
apt-get install libevent-dev
cd ~/bin/tmux
./configure
make
cd ~
ln ~/bin/tmux/tmux ~/bin/tmux
cp ~/github/config_files/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
cp ~/github/config_files/.tmux/plugins/tmux-powerline/themes/ddtheme.sh ~/.tmux/plugins/tmux-powerline/themes/ddtheme.sh
cp ~/github/config_files/.tmux-powerlinerc ~/.tmux-powerlinerc

echo "@>> setup tmuxinator"

gem install tmuxinator
touch ~/..tmuxinator
cp -a ~/github/config_files/.tmuxinator/. ~/.tmuxinator/

echo "@>> setup neovim"

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get --assume-yes install neovim
sudo apt-get --assume-yes install python-neovim
sudo apt-get --assume-yes install python3-neovim
pip install pynvim
pip3 install pynvim
sudo apt-get --assume-yes install xclip
npm install -g neovim
gem install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
cp ~/github/config_files/.vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
mkdir ~/.config/nvim/colors
cp ~/github/config_files/.config/nvim/colors/dante_modified.vim ~/.config/nvim/colors/dante_modified.vim
vim +PlugInstall +qall

echo "@>> setup universal-ctags"

git clone https://github.com/universal-ctags/ctags.git ~/Downloads/universal-ctags
sudo apt-get --assume-yes install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
cd ~/Downloads/universal-ctags
./autogen.sh
./configure
make
sudo make install
cd ~/

echo "@>> install chrome"

wget --output-document ~/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb

echo "@>> setup whatsapp"

cp ~/github/config_files/.local/share/applications/whatsapp.desktop ~/.local/share/applications/whatsapp.desktop

echo "@>> install docker"

sudo apt-get --assume-yes install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

echo "@>> setup numix circle icons"

sudo add-apt-repository ppa:numix/ppa -y
sudo apt-get --assume-yes install numix-icon-theme-circle

echo "@>> install slack"

curl https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb -o ~/Downloads/slack.deb
sudo apt-get --assume-yes install ~/Downloads/slack.deb

echo "@>> install gnome-system-monitor from apt"

sudo snap remove --purge gnome-system-monitor
sudo apt-get --assume-yes install gnome-system-monitor

echo "@>> install spotify"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get --assume-yes install spotify-client

echo "@>> configure system"

# generic packages
sudo apt-get --assume-yes install silversearcher-ag
git clone --depth 1 https://github.com/junegunn/fzf.git ~/Downloads/fzf
echo "yyy" | ~/Downloads/fzf/install

# custom monitor scaling
mkdir ~/.config/autostart
cp ~/github/config_files/.config/autostart/normalize_monitor_scales.desktop ~/.config/autostart/normalize_monitor_scales.desktop
chmod +x ~/bin/normalize_monitor_scales.sh

# setup profile picture
sudo cp ~/github/config_files/dd_logo_blue_bg.png /var/lib/AccountsService/icons/dominikduda
echo "Icon=/var/lib/AccountsService/icons/dominikduda" | sudo tee -a /var/lib/AccountsService/users/dominikduda

# load system settings
dconf load / < ~/github/config_files/system_settings_backup.dconf

# TODO:
# - install gnupg
# - install shutter
# - save importjs config file + install the lib here
# - add encrypted ssh keys to repo
# - add encrypted credentials
# - delete decrytped credentials and or bash history at end of script
# - when encryption is working remove ssh file check from beginning of the script
# - login into docker using the credential file
# - get username (dominikduda) dynamically everywhere

) 2>&1 | tee ~/Desktop/system_setup_logs.txt

)
