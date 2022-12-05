#!/bin/sh

exec > >(tee -i $HOME/codespace_dotfiles_install.log)
exec 2>&1

set -x

if [ "$CODESPACES" != "true" ]; then
  echo "Not running in a codespace, exiting"
  exit 1
fi

gh repo clone jacortinas/dotfiles $HOME/.dotfiles

apt-get install software-properties-common
add-apt-repository ppa:martin-frost/thoughtbot-rcm
apt-get update

apt-get install -y \
  ripgrep bat fzf lua rcm tmux neovim
