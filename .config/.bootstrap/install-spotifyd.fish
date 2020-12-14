#!/bin/fish

mkdir -p $HOME/.local/src
cd $HOME/.local/src

git clone https://github.com/charleswillis3/spotifyd
cd spotifyd

cargo build --release
cargo install --path . --locked

cp contrib/spotifyd.service $HOME/.config/systemd/user/

