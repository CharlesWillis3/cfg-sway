#!/bin/bash

[ $DISPLAY ] && echo "Don't run from a graphic terminal!" && exit

BAK=/.bak/$(id -un)
ID_GROUP=$(id -un):$(id -gn)

if [[ "$1" == "--restore" ]]; then
    [ ! -d $BAK ] && echo "!Backup does not exist, exiting." && echo "$BAK" && exit
    read -p "!This process is descructive. Confirm? [<enter> | <^c> to abort]"
    cd /
    rm --recursive --force $HOME
    sudo cp --recursive $BAK /home
    sudo chown --recursive $ID_GROUP $HOME
    cd $HOME
    exit
fi

[ -d $BAK ] && echo "!Backup exists, exiting." && echo "$BAK" && exit 

###################
### Backup home ###
###################
sudo mkdir --parent --verbose $BAK
sudo cp --recursive $HOME /.bak

echo "Backed up to: $BAK"

