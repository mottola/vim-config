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

echo "Creating package folder"
mkdir -p ~/.vim/pack/rswplugins/start

echo "Changing to package directory"
cd ~/.vim/pack/rswplugins/start

echo "Downloading plugins from github..."
echo ""
git submodule add "https://github.com/AndrewRadev/vim-eco.git" pack/rswplugins/start/vim-eco
git submodule add "https://github.com/derekwyatt/vim-scala.git" pack/rswplugins/start/vim-scala
git submodule add "https://github.com/flazz/vim-colorschemes.git" pack/rswplugins/start/vim-colorschemes
git submodule add "https://github.com/genoma/vim-less.git" pack/rswplugins/start/vim-less
git submodule add "https://github.com/jeyb/vim-jst.git" pack/rswplugins/start/vim-jst
git submodule add "https://github.com/kchmck/vim-coffee-script.git" pack/rswplugins/start/vim-coffee-script
git submodule add "https://github.com/ctrlpvim/ctrlp.vim.git" pack/rswplugins/start/ctrlp.vim
git submodule add "https://github.com/majutsushi/tagbar.git" pack/rswplugins/start/tagbar
git submodule add "https://github.com/marijnh/tern_for_vim.git" pack/rswplugins/start/tern_for_vim
git submodule add "https://github.com/nono/vim-handlebars.git" pack/rswplugins/start/vim-handlebars
git submodule add "https://github.com/octol/vim-cpp-enhanced-highlight.git" pack/rswplugins/start/vim-cpp-enhanced-highlight
git submodule add "https://github.com/pangloss/vim-javascript.git" pack/rswplugins/start/vim-javascript
git submodule add "https://github.com/PProvost/vim-ps1.git" pack/rswplugins/start/vim-ps1
git submodule add "https://github.com/Rip-Rip/clang_complete.git" pack/rswplugins/start/clang_complete
git submodule add "https://github.com/rking/ag.vim.git" pack/rswplugins/start/ag.vim
git submodule add "https://github.com/scrooloose/nerdtree.git" pack/rswplugins/start/nerdtree
git submodule add "https://github.com/scrooloose/syntastic.git" pack/rswplugins/start/syntastic
git submodule add "https://github.com/tpope/vim-fugitive.git" pack/rswplugins/start/vim-fugitive
git submodule add "https://github.com/tpope/vim-haml.git" pack/rswplugins/start/vim-haml
git submodule add "https://github.com/tpope/vim-liquid.git" pack/rswplugins/start/vim-liquid
git submodule add "https://github.com/tpope/vim-surround.git" pack/rswplugins/start/vim-surround
git submodule add "https://github.com/vim-scripts/bufkill.vim.git" pack/rswplugins/start/bufkill.vim
git submodule add "https://github.com/vim-scripts/VimClojure.git" pack/rswplugins/start/VimClojure
git submodule add "https://github.com/vim-scripts/YankRing.vim.git" pack/rswplugins/start/YankRing.vim
git submodule add "https://github.com/wavded/vim-stylus.git" pack/rswplugins/start/vim-stylus

cd ~-

}
