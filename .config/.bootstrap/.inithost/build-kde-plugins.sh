#!/bin/bash

yay --noconfirm --needed -S qt5-tools base-devel cmake gcc git extra-cmake-modules python plasma-framework plasma-desktop gettext kdecoration typescript make p7zip dart-sass gtk-engine python-cairo

mkdir -p $HOME/.usr/src
cd $HOME/.usr/src

### KDE Rounded Corners ###

git clone http://github.com/alex47/KDE-Rounded-Corners
cd KDE-Rounded-Corners
mkdir qt5build
cd qt5build
cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DQT5BUILD=ON && make && sudo make install && (kwin_x11 --replace &)

cd $HOME/.usr/src

### Window Buttons ###
git clone http://github.com/psifidotos/applet-window-buttons
cd applet-window-buttons
sh install.sh

cd $HOME/.usr/src

### Latte Dock ###

git clone http://github.com/KDE/latte-dock
cd latte-dock
sh install.sh

cd $HOME/.usr/src

### Krohnkite ###

git clone https://github.com/esjeon/krohnkite
cd krohnkite
make install
mkdir -p ~/.local/share/kservices5/
ln -s ~/.local/share/kwin/scripts/krohnkite/metadata.desktop ~/.local/share/kservices5/krohnkite.desktop

### Monochrome Theme ###

git clone https://github.com/pwyde/monochrome-kde
cd monochrome-kde
bash install.sh --install

papirus-folders -C grey

cd $HOME/.usr/src

git clone https://anongit.kde.org/breeze-gtk.git

cd breeze-gtk/src/
sudo sh build_theme.sh -c Monochrome -t /usr/share/themes/Monochrome

cd
