#!/bin/bash
# pass --noconfirm to skip confirmations

GHNAME="Charles Willis"
GHEMAIL=5862883+CharlesWillis3@users.noreply.github.com
SSHKEYFILE=$HOME/.ssh/id_inithost

DOTFILES_REPO=git@github.com:charleswillis3/cfg-sway

__DIRNAME__="$(dirname $(readlink -f $0))"

confirm() {
  [ "$1" == "--noconfirm" ] && return
  read -p "🗨️ $2? [y/n]:  " -n 1 -r
  echo
  [ "$REPLY" == "y" ] && return
  
  false
}

######################
### Setup chromium ###
######################
if confirm "$1" "Setup chromium w/ dashlane extension"; then
    sudo pacman --noconfirm --needed -S chromium kdialog

    echo +++ Making chromium policy directories
    sudo mkdir -pv /etc/chromium/policies/{managed,recommended}

    echo +++ Setting chromium managed policy
    sudo touch /etc/chromium/policies/managed/inithost_policy.json
    echo '{ "ExtensionInstallForcelist":["fdjamakpfbbddfjaooikfcpapjohcfmg;https://clients2.google.com/service/update2/crx",],}' | sudo tee /etc/chromium/policies/managed/inithost_policy.json
fi

if confirm "$1" "Set BROWSER to chromium"; then
    echo +++ Setting chromium as default browser
    export BROWSER="/usr/bin/chromium --disable-gpu --disable-software-rasterizer"
fi

####################
### Setup github ###
####################
if confirm "$1" "Setup github cli and authenticate"; then
    sudo pacman --noconfirm --needed -S github-cli

    echo +++ Authenticate
    gh auth login --hostname github.com --web --scopes write:public_key
fi

if confirm "$1" "Generate ssh key and sync to github"; then
    echo +++ Generate ssh key $SSHKEYFILE for $GHEMAIL
    ssh-keygen -t ed25519 -C "$GHEMAIL" -f $SSHKEYFILE

    # start the ssh-agent in the background
    eval $(ssh-agent -s)
    ssh-add $SSHKEYFILE

    if confirm "$1" ">>> Upload key to github"; then
        gh api user/keys -i --field title='inithost.sh '"$(hostname)_$(date)"'' --field key='@'"$SSHKEYFILE.pub"'' 

        echo +++ Switching gh to ssh protocol
        gh config set git_protocol ssh
    fi
fi

##################
### Yadm clone ###
##################
if confirm "$1" "Sync dotfiles"; then
    sudo yay --noconfirm --needed -S yadm-git
    yadm clone $DOTFILES_REPO
    yadm status
fi

echo 'Done ✔. Welcome $HOME, '"$(id -un) 😃"
