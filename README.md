# Quick Install

**NOTE:** You need the latest vim version for this config.

### Mac OS & Linux

To run the quick install on nix based systems:

```bash
curl -o- https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.sh | bash
```

### Windows

To run the quick install script on a Windows based system in `cmd.exe`:

```
bitsadmin.exe /transfer "X" https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.bat %userprofile%\rsw_install_vim_config.bat && %userprofile%\rsw_install_vim_config.bat && del %userprofile%\rsw_install_vim_config.bat
```

This should be mostly reliable across Windows systems.

# Getting Recent Vim Versions

### Mac OS X

There are frequently updated binaries available for Mac OS X here:

[https://github.com/macvim-dev/macvim/releases](https://github.com/macvim-dev/macvim/releases)

### Windows

There are frequently updated binaries available for Windows here:

[https://github.com/vim/vim-win32-installer/releases](https://github.com/vim/vim-win32-installer/releases)

### Ubuntu

Ubuntu 16.04 Xenial Xerus has a vim version that should work.

```
sudo apt-get install vim-nox vim-gtk
```

### Compiling Vim on Ubuntu

Check out this [Easy Guide to Compiling Vim on Ubuntu](https://github.com/rocksolidwebdesign/vim-config/wiki/Easy-Guide-to-Compiling-Vim-on-Ubuntu) for Ubuntu 16.04 Xenial.

Instructions should be applicable if not identical on most Ubuntu based installations including e.g. Mint or Ubuntu 14.04 Trusty.

Rationale:

On older versions of Ubuntu such as 14.04, for broader scripting language support and/or to have the most up to date features, you may wish to compile vim yourself.

Xenial's vim doesn't have Python 2.7 support, so you may need to compile if you want `clang_complete` support.

# Requirements

You must have a recent version of vim installed already.

- Vim 7.4.1689 or greater
- Git

Vim 7.4.1689 or greater is recommended.

Vim versions 7.4.1553 and later should probably work.

Specifically, vim requires the relatively new plugin management feature called `packages`. You can check that your vim install has this feature with:

```
:help packages
```

#### Optional Requirements

If you want `clang_complete` plugin support you'll need:

- Clang 3.8
- Python 2.7.10

```
sudo apt-get install clang libpython27-dev
```

Install XCode, the XCode Command Line Tools and `homebrew` on Mac OS X.

Use the [Clang](http://llvm.org/releases/download.html) and [Python 2.7.10](https://www.python.org/downloads/release/python-2710/) installers on Windows.

NOTE: Python 2.7.11 appears to sometimes pose an issue. Windows builds are currently built against Python 2.1.10 so check to see that 2.7.10 is installed if you're troubleshooting Python with vim.

NOTE: Vim and Python must be compiled for the same architecture, so if your Python is 64 bit, then make sure your vim is also 64 bit.

NOTE: This `vimrc` explicitly links to the 64 bit version of clang 3.8 on Ubuntu Xenial. Clang support appears to work out of the box on Mac OS X, and with vanilla installs of Clang for Windows. For troubleshooting clang integration, check the `vimrc` and try removing or changing where `g:clang_library_path` points to.

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

You must then download plugins with git:

```
cd ~/.vim
git submodule init
git submodule update
```
