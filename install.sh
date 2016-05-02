#!/usr/bin/env bash

{

ts=$(date +%Y%m%d%H%M%S)
if [ -f ~/.vimrc ]; then
	echo "Backing up ~/.vimrc to ~/.vimrc_${ts}.bak"
	mv ~/.vimrc ~/.vimrc_${ts}.bak
fi

if [ -d ~/.vim ]; then
	echo "Backing up ~/.vim to ~/.vim_${ts}.bak"
	mv ~/.vim ~/.vim_${ts}.bak
fi

git clone https://github.com/rocksolidwebdesign/vim-config.git ~/.vim

cd ~/.vim

echo "Downloading plugins from github..."
echo ""
git submodule init
git submodule update

cd ~-

}
