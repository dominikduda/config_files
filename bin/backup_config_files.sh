#!/bin/bash

declare -a pathsFromHome=(
  # VIM stuff
  ".vimrc"
  ".config/nvim/colors/dante_modified.vim"
  # R
  ".rstudio-desktop"
  ".config/RStudio"
  ".Rprofile"
  # ZSH
  ".zshrc"
  ".oh-my-zsh/themes/thedd.zsh-theme"
  # TMUX
  ".tmux.conf"
  ".tmux-powerlinerc"
  ".tmux/plugins/tmux-powerline/themes/ddtheme.sh"
  # bin
  "bin/fix_vim_syntax_files.sh"
  "bin/setup_md.sh"
  "bin/backup_config_files.sh"
  "bin/normalize_monitor_scales.sh"
  "bin/generate_wallpaper.sh"
  "bin/clear_thumbs_cache.sh"
  # autostart
  ".config/autostart/normalize_monitor_scales.desktop"
  # custom app starters
  ".local/share/applications/whatsapp.desktop"
  # git
  ".gitconfig"
  ".gitignore"
  # other
  ".config/redshift.conf"
  ".importjs.js.example"
  # Jforex
  "JForex/Templates/thedd.tmpl"
)

for filePath in "${pathsFromHome[@]}"
do
  echo "@>> Backing up $filePath"
  path_from=$HOME/$filePath
  path_to=$HOME/github/config_files/$filePath
  cp $path_from "$path_to"
done

# TMUXINATOR special recursive case
cp -r ~/.tmuxinator/. ~/github/config_files/.tmuxinator
