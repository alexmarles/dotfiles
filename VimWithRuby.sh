#!/bin/bash

echo "Cloning vim repository in vim directory"
hg clone https://vim.googlecode.com/hg/ vim
cd vim
echo "Configuring installation with ruby and python interpreters"
./configure --prefix=/usr/local --enable-rubyinterp --enable-pythoninterp --with-features=huge
echo "Running make and installing in your '/usr/local/bin' path"
make
sudo make install
echo "Deleting vim files"
make clean
make distclean
cd ..
rm -rf vim
echo "Make sure '+ruby' and '+python' options apear when you run 'vim --version'"
echo "Make sure to add '/usr/local/bin' at beggining of your PATH in your rc file"
