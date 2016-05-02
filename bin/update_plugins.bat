@echo off
echo "Updating plugins from github..."

cd %userprofile%\vimfiles
git submodule update --remote
