#!/usr/bin/env bash

backup_config() {
  local backupfolder path
  backupfolder=$1
  path=$2
  if [ -d $path ] || [ -f $path ] || [ -L $path ]; then
    mv $path $backupfolder
    echo "backupped $path"
  fi
}

backup() {
  local backupfolder date
	date=$(date +"%Y%m%d_%H%M%S")
  backupfolder=$HOME/dotfiles.old/$date
  mkdir -p $backupfolder
  backup_config $backupfolder "$HOME/.config/nvim"
  backup_config $backupfolder "$HOME/.zshrc"
  backup_config $backupfolder "$HOME/.config/zsh"
  backup_config $backupfolder "$HOME/.tmux.conf"
  backup_config $backupfolder "$HOME/.config/i3"
  backup_config $backupfolder "$HOME/.config/polybar"
  backup_config $backupfolder "$HOME/.config/termite"
}

backup_request() {
  while true; do
    read -p "Do you want to backup existing dotfiles? Already existing configs will be overridden!" yn
    case $yn in
      [Yy]* ) backup; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no."
    esac
  done
}

configure_config_folder() {
  local src dest
  src=$1
  dest=$2 || $1
  ln -sf "$BASEDIR/$src" "$HOME/.config/$dest"
  echo "configured $src"
}

vim() {
  configure_config_folder "vim" "nvim"
}

zsh() {
  ln -sf "$BASEDIR/zshrc" "$HOME/.zshrc"
  configure_config_folder "zsh"
}

tmux() {
  ln -sf "$BASEDIR/tmux.conf" "$HOME/.tmux.conf"
  echo "configured tmux"
}

i3() {
  configure_config_folder "i3"
}

polybar() {
  configure_config_folder "polybar"
}

termite() {
  configure_config_folder "termite"
}

BASEDIR=$(realpath $(dirname "$0"))

backup_request
vim
zsh
tmux
i3
polybar
termite
