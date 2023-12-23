#!/bin/bash

# yaya we update it all
sudo apt update
sudo apt ugrade

# we install
sudo apt install build-essentials
sudo apt install unzip
sudo apt install zip
sudo apt install xclip
sudo apt-get install ripgrep
sudo apt install fd-find
sudo apt install luarocks
sudo apt-get install python3-pip
python3 -m pip install pynvim

# omg node version manager?!
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

# we dev
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# just golang nothing to see here
if ! command -v go &>/dev/null; then
    sudo wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -P ~/code
    sudo tar -C /usr/local -xzf ~/code/go1.21.5.linux-amd64.tar.gz
    go_path="/usr/local/go/bin"
    sudo echo 'export PATH=$PATH:'"$go_path" >> ~/.bashrc
    export PATH=$PATH:$go_path
    rm -rf ~/code/go1.21.5.linux-amd64.tar.gz
    source ~/.bashrc
fi 

# 🤓 I use vim btw
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# we config
cp -r ./nvim ~/.config/nvim

# we do a little alias
sudo echo 'alias v=nvim_here() {
    if [ $# -eq 0 ]; then
        nvim .
    else
        nvim "$@"
    fi
}nvim_here' >> ~/.bashrc

source ~/.bashrc

echo "Installed everything, please remember to install node..."
echo "Ah, also install npm neovim package afterwards"
