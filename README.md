# Quick Install

**NOTE:** This config requires vim 7.4.1811 or greater. See below for obtaining the up to date vim versions.

### Mac OS & Linux

To run the quick install on nix based systems:

```bash
curl -o- https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.sh | bash
```

### Windows

To run the quick install script on a Windows based system:

```
bitsadmin.exe /transfer "X" https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.bat %userprofile%\rsw_install_vim_config.bat && %userprofile%\rsw_install_vim_config.bat && del %userprofile%\rsw_install_vim_config.bat
```

# Getting Recent Vim Versions

### Mac OS X

There are frequently updated binaries available for Mac OS X here:

[https://github.com/macvim-dev/macvim/releases](https://github.com/macvim-dev/macvim/releases)

### Windows

There are frequently updated binaries available for Windows here:

[https://github.com/vim/vim-win32-installer/releases](https://github.com/vim/vim-win32-installer/releases)

### Ubuntu

You will likely need to compile vim manually to obtain a recent and reliable version.

Check out this [Easy Guide to Compiling Vim on Ubuntu](https://github.com/rocksolidwebdesign/vim-config/wiki/Easy-Guide-to-Compiling-Vim-on-Ubuntu) for Ubuntu 16.04 Xenial.

Instructions should be applicable to most Ubuntu variants including e.g. Mint or Ubuntu 14.04 Trusty.

# Requirements

You must have a recent version of vim installed already.

- Vim 7.4.1811 or greater
- Git
- Clang
- Python 2.7.10

# Usage

The root folder of the repository is a `~/.vim` folder with a config file.

The configuration is intented to be installed and used as you would use a normal `~/.vim` folder.

Installation consists of
  - Downloading the config
  - Installing the config by renaming the downloaded folder
  - Fetching the plugins via git

You may use one of the Quick Install scripts above or install manually.

### Manual Installation

You may download the repository as a zip file and unzup to your home or user folder.

You must manually download git modules with, for example:

```
cd ~/.vim
git submodule init
git submodule update
```
