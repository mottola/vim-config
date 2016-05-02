#!/usr/bin/env bash

{

echo "Updating plugins from github..."

cd ~/.vim
git submodule update --remote

}
