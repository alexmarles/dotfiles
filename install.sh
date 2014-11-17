#!/bin/bash

cp .gitconfig.example .gitconfig

files=".vim .vimrc .zshrc .gitconfig .tmux.conf .ackrc"

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

echo "Setting git config"
echo -n "Enter your name: "
read gitname
git config --global user.name "$gitname"
echo -n "Enter your email: "
read gitmail
git config --global user.email "$gitmail"
echo "Adding global ignores"
git config --global core.excludesfile .gitignore_global
