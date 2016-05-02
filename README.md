# Requirements

You must have a recent version of vim installed already.

- Vim 7.4.1811 or greater
- Git

# Install

The root folder of the repository is a `~/.vim` folder with a config file.

The configuration is intented to be installed and used as you would use a normal `~/.vim` folder.

Installation consists of
  - Downloading the config
  - Installing the config by renaming the downloaded folder
  - Fetching the plugins via git

### Mac OS & Linux

```bash
curl -o- https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.sh | bash
```

### Windows

```
bitsadmin.exe /transfer "X" https://raw.githubusercontent.com/rocksolidwebdesign/vim-config/master/install.bat %userprofile%\rsw_install_vim_config.bat && %userprofile%\rsw_install_vim_config.bat && del %userprofile%\rsw_install_vim_config.bat
```

### Zip File

You may download the repository as a zip file and unzup to your home or user folder.

# Getting Recent Vim Versions

### Mac OS X

There are frequently updated binaries available for Mac OS X here:

[https://github.com/macvim-dev/macvim/releases](https://github.com/macvim-dev/macvim/releases)

### Windows

There are frequently updated binaries available for Windows here:

[https://github.com/vim/vim-win32-installer/releases](https://github.com/vim/vim-win32-installer/releases)

# Compiling on Ubuntu

You will probably need to compile vim yourself if you want the latest version.

Here are general instructions for Ubuntu 16.04 Xenial.

Remove the version of vim installed by Ubuntu, if present.

```bash
sudo apt-get remove --purge 'vim*'
```

#### Scripting support

Install dependencies for Python, Perl, Ruby and tcl scripting.

```bash
sudo apt-get install libgtk-3-dev cscope python libpython-dev libpython3-dev python3 perl libperl-dev tcl tcl-dev tk tk-dev ruby ruby-dev
```

#### Lisp scripting support

Install Racket (formerly PLT Scheme) from source for lisp scripting integration.

See [https://download.racket-lang.org/](https://download.racket-lang.org/) for the latest source version.

NOTE: Vim is currently incompatible with futures and places in Racke 5.x and greater. To ensure compatibility, you must build from source and disable these options.

NOTE: Installing to `/usr/local` seems already compatible with the vim `./configure` script out of the box.

WARNING: Compiling and installing Racket may take a *very* long time, up to 30 minutes, depending on your system speed. It is recommended to disable building of the docs and GUI unless you absolutely need them.

```bash
# compile racket from source and install in --prefix=/usr/local
wget https://mirror.racket-lang.org/installers/6.5/racket-6.5-src.tgz
tar -zxf racket-6.5-src.tgz
cd racket-6.5

# recommended configure options if only using for vim integration
./configure --disable-futures --disable-places --disable-docs --disable-gracket --prefix=/usr/local
make
sudo make install # this might take a very long time
```

#### Lua scripting support

Required for plugins like `Neocomplete`.

Install LUA from source.

Detailed instructions [https://www.lua.org/manual/5.3/readme.html](https://www.lua.org/manual/5.3/readme.html)

NOTE: It is recommended to **NOT** install the lua 5.3 dev libs package from ubuntu or the `./configure` script will not properly recognize the version built from source.

NOTE: The `./configure` script only appears to work when **NOT** using dynamically linked lua.

```bash
wget https://www.lua.org/ftp/lua-5.3.2.tar.gz
tar -zxf lua-5.3.2.tar.gz
cd lua-5.3.2/
make linux
sudo make install
```

Download the vim source and compile.

```bash
# http://vimhelp.appspot.com/various.txt.html#%2Bfeature-list
git clone https://github.com/vim/vim.git
cd vim
# git pull # update to the latest version if you had the repo cloned already
# ./configure --help # get a list of available options if you want to customize this

## CONFIGURE COMMAND
make distclean && ./configure \
    --prefix=/usr \
    --with-features=huge \
    --enable-gui=gtk3 \
    --enable-cscope \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-tclinterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-perlinterp=dynamic \
    --enable-luainterp \
    --with-lua-prefix=/usr/local \
    --enable-mzschemeinterp

make && sudo make install
```
