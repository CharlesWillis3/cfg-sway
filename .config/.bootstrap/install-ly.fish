#!/bin/fish

mkdir -p $HOME/.local/src
cd $HOME/.local/src

git clone https://github.com/nullgemm/ly.git
cd ly

make github

make

sudo make install
