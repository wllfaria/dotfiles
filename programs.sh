#!/bin/bash

sudo apt update
sudo apt upgrade

# window manager
sudo apt install awesome

# utils
sudo apt install arandr
sudo apt install nitrogen

# Alacritty
sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# picom dependencies
sudo apt install libxext-dev 
sudo apt install libxcb1-dev 
sudo apt install libxcb-damage0-dev 
sudo apt install libxcb-xfixes0-dev 
sudo apt install libxcb-shape0-dev 
sudo apt install libxcb-render-util0-dev 
sudo apt install libxcb-render0-dev 
sudo apt install libxcb-randr0-dev 
sudo apt install libxcb-composite0-dev 
sudo apt install libxcb-image0-dev 
sudo apt install libxcb-present-dev 
sudo apt install libxcb-xinerama0-dev 
sudo apt install libxcb-glx0-dev 
sudo apt install libpixman-1-dev 
sudo apt install libdbus-1-dev 
sudo apt install libconfig-dev 
sudo apt install libgl1-mesa-dev 
sudo apt install libpcre2-dev 
sudo apt install libpcre3-dev 
sudo apt install libevdev-dev 
sudo apt install uthash-dev 
sudo apt install libev-dev 
sudo apt install libx11-xcb-dev 
sudo apt install meson

git clone https://github.com/dccsillag/picom/ /tmp/picom
cd /tmp/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

# spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# discord
wget https://dl.discordapp.net/apps/linux/0.0.41/discord-0.0.41.deb
sudo apt install ./discord-0.0.41.deb

# OBS
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio

sudo luarocks install lgi
cargo install stylua
