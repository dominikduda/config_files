#!/bin/bash

# vim
cp ~/.vimrc ~/github/config_files/.vimrc
cp ~/.config/nvim/colors/dante_modified.vim ~/github/config_files/.config/nvim/colors/dante_modified.vim

# RStudio
cp -r ~/.rstudio-desktop ~/github/config_files/.rstudio-desktop
cp -r ~/.config/RStudio ~/github/config_files/.config/RStudio


# zsh
cp ~/.zshrc ~/github/config_files/.zshrc

# tmux
cp ~/.tmux.conf ~/github/config_files/.tmux.conf
cp ~/.tmux-powerlinerc ~/github/config_files/.tmux-powerlinerc
cp ~/.tmux/plugins/tmux-powerline/themes/ddtheme.sh ~/github/config_files/.tmux/plugins/tmux-powerline/themes/ddtheme.sh

# tmuxinator
cp -r ~/.tmuxinator/. ~/github/config_files/.tmuxinator

# bin
cp ~/bin/fix_vim_syntax_files.sh ~/github/config_files/bin/fix_vim_syntax_files.sh
cp ~/bin/setup_md.sh ~/github/config_files/bin/setup_md.sh
cp ~/bin/backup_config_files.sh ~/github/config_files/bin/backup_config_files.sh

# other
cp ~/.config/redshift.conf ~/github/config_files/.config/redshift.conf
cp ~/.gitconfig ~/github/config_files/.gitconfig
cp ~/.gitignore ~/github/config_files/.gitignore
cp ~/.importjs.js.example ~/github/config_files/.importjs.js.example
