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

git clone git@github.com:rocksolidwebdesign/vim-config.git ~/.vim

echo "Creating package folder"
mkdir -p ~/.vim/pack/rswplugins/start

echo "Changing to package directory"
cd ~/.vim/pack/rswplugins/start

echo "Downloading plugins from github..."
echo ""
git clone "https://github.com/AndrewRadev/vim-eco.git"
git clone "https://github.com/derekwyatt/vim-scala.git"
git clone "https://github.com/flazz/vim-colorschemes.git"
git clone "https://github.com/genoma/vim-less.git"
git clone "https://github.com/jeyb/vim-jst.git"
git clone "https://github.com/kchmck/vim-coffee-script.git"
git clone "https://github.com/ctrlpvim/ctrlp.vim.git"
git clone "https://github.com/majutsushi/tagbar.git"
git clone "https://github.com/marijnh/tern_for_vim.git"
git clone "https://github.com/nono/vim-handlebars.git"
git clone "https://github.com/octol/vim-cpp-enhanced-highlight.git"
git clone "https://github.com/pangloss/vim-javascript.git"
git clone "https://github.com/PProvost/vim-ps1.git"
git clone "https://github.com/Rip-Rip/clang_complete.git"
git clone "https://github.com/rking/ag.vim.git"
git clone "https://github.com/scrooloose/nerdtree.git"
git clone "https://github.com/scrooloose/syntastic.git"
git clone "https://github.com/tpope/vim-fugitive.git"
git clone "https://github.com/tpope/vim-haml.git"
git clone "https://github.com/tpope/vim-liquid.git"
git clone "https://github.com/tpope/vim-surround.git"
git clone "https://github.com/vim-scripts/bufkill.vim.git"
git clone "https://github.com/vim-scripts/VimClojure.git"
git clone "https://github.com/vim-scripts/YankRing.vim.git"
git clone "https://github.com/wavded/vim-stylus.git"

cd ~-

}
