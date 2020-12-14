#!/bin/bash

[[ "$1" != "--confirm" ]] && echo "Destructive! Must pass --confirm" && exit 

sudo pacman --noconfirm -R chromium
sudo pacman --noconfirm -R github-cli
export BROWSER=
sudo rm -rf /etc/chromium
shred -u  $HOME/.ssh/id_inithost* 