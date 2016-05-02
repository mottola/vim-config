#!/usr/bin/env bash

{

echo "Updating plugins from github..."

find ~/.vim/pack/myplugins/start -mindepth 1 -maxdepth 1 -type d -exec bash -c 'echo "Updating $1" && cd $1 && git pull' _ "{}" \;

}
