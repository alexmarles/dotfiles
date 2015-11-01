#!/bin/bash

echo "Installing Homebrew for package managing"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing last git from brew"
brew install git

echo "Installing ZSH"
brew install zsh
sudo chsh -s $(which zsh) $USER

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "DONE! Restart your terminal NOW!"
