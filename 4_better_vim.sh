#!/usr/bin/sh

echo "Well let's make better the better ;-)"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo " Nerd Tree  "
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo "DONE"