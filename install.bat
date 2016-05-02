@echo off
setlocal

REM
REM GET A UNIQUE ID FOR THE BACKUP FILES
REM ########################################################
REM
set "idstamp=%random%%random%%random%%random%%random%%random%"

REM
REM GENERATE BACKUP FILE NAMES
REM ########################################################
REM
set "vimfilesbak=vimbak_%idstamp%_vimfiles"
set "vimrcbak=vimbak_%idstamp%_vimrc"
set "dotvimrcbak=vimbak_%idstamp%_dot_vimrc"

REM
REM BACKUP CURRENT CONFIG FILES
REM ########################################################
REM
echo "Making config backups"
echo "It's ok if some of these fail, it just means you don't yet have any config information to backup."
@echo on
move %userprofile%\vimfiles %userprofile%\%vimfilesbak%
move %userprofile%\_vimrc %userprofile%\%vimrcbak%
move %userprofile%\.vimrc %userprofile%\%dotvimrcbak%

@echo off

REM
REM INSTALL THIS CONFIG
REM ########################################################
REM
echo "Cloning vim config repo"
set "repo_url=https://github.com/rocksolidwebdesign/vim-config.git"
git clone %repo_url% %userprofile%\vimfiles

mkdir %userprofile%\vimfiles\pack\rswplugins\start
cd %userprofile%\vimfiles\pack\rswplugins\start

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

endlocal
