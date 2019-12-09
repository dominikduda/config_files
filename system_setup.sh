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

echo "@>> Installing RVM"

sudo apt --assume-yes install gnupg2
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.bashrc
rvm install ruby-2.6
/bin/bash --login
rvm --default use 2.6

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

echo "@>> setup R"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' -y
sudo apt update
sudo apt --assume-yes install r-base
cp ~/github/config_files/.Rprofile ~/.Rprofile
pip3 install radian
sudo Rscript -e "install.packages('pacman')"

echo "@>> setup chart wallpaper"

cp ~/github/config_files/bin/generate_wallpaper.sh ~/bin/generate_wallpaper.sh
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

cp ~/github/config_files/.zshrc ~/.zshrc
sudo apt install zsh
echo "n" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
sudo chsh -s /bin/zsh

echo "@>> setup tmux"

sudo apt install tmux
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
sudo apt --assume-yes install neovim
sudo apt --assume-yes install python-dev python-pip python3-dev python3-pip
sudo apt --assume-yes install python-neovim
sudo apt --assume-yes install python3-neovim
pip install pynvim
pip3 install pynvim
sudo apt --assume-yes install xclip
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

mkdir ~/Desktop/universal-ctags
git clone https://github.com/universal-ctags/ctags.git ~/Desktop/universal-ctags
sudo apt --assume-yes install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev
cd ~/Desktop/universal-ctags
./autogen.sh
./configure
make
sudo make install
cd ~/

echo "@>> install chrome"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "@>> setup whatsapp"

cp ~/github/config_files/.local/share/applications/whatsapp.desktop ~/.local/share/applications/whatsapp.desktop

echo "@>> install docker"

sudo apt --assume-yes install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "@>> setup numix circle icons"

sudo add-apt-repository ppa:numix/ppa -y
sudo apt --assume-yes install numix-icon-theme-circle
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"

echo "@>> install slack"

curl https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb -o ~/Downloads/slack.deb
sudo apt --assume-yes install ~/Downloads/slack.deb

echo "@>> install gnome-system-monitor from apt"

sudo snap remove --purge gnome-system-monitor
sudo apt --assume-yes install gnome-system-monitor

echo "@>> install spotify"

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt --assume-yes install spotify-client

echo "@>> set favourite bar"

dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'nautilus.desktop', 'gnome-system-monitor.desktop', 'gnome-terminal.desktop', 'spotify.desktop', 'whatsapp.desktop', 'slack.desktop']"

echo "@>> configure system"

# flux
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
# workspaces work on multiple monitors
gsettings set org.gnome.mutter workspaces-only-on-primary false

gsettings set org.gnome.desktop.peripherals.keyboard delay 150
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings set org.gnome.desktop.interface cursor-size 40

# import terminal profile
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/github/config_files/gnome-terminal-profiles.dconf

# custom monitor scaling
mkdir ~/.config/autostart
cp ~/github/config_files/.config/autostart/normalize_monitor_scales.desktop ~/.config/autostart/normalize_monitor_scales.desktop
cp ~/github/config_files/bin/normalize_monitor_scales.sh ~/bin/normalize_monitor_scales.sh
chmod +x ~/bin/normalize_monitor_scales.sh

# setup profile picture
echo "Icon=/var/lib/AccountsService/icons/dominikduda" | sudo tee -a /var/lib/AccountsService/users/dominikduda
sudo cp ~/github/config_files/dd_logo_blue_bg.png /var/lib/AccountsService/icons/dominikduda

source ~/.bashrc

)
