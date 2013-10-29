#!/bin/bash

files=".vim .vimrc .zshrc .gitconfig .tmux.conf"

for file in $files
do
  if [ -L $HOME/$file ]; then
    unlink $HOME/$file
  fi
  echo "Linking $file"
  ln -s $HOME/.dotfiles/$file $HOME
done

echo "Fetching submodules for vim plugins"
git submodule update --init

echo "Adding global ignores"
git config --global core.excludesfile .gitignore_global
