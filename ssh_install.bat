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
set "repo_url=git@github.com:rocksolidwebdesign/vim-config.git"
git clone %repo_url% %userprofile%\vimfiles

cd %userprofile%\vimfiles

echo "Downloading plugins from github..."

git submodule init
git submodule update

endlocal
