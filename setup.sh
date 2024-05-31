# Installing nix
# sh <(curl -L https://nixos.org/nix/install) --daemon

# installing home-manager
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install

# enabling flakes
# mkdir ~/.config/nix
# echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# setting up home
# home-manager switch --flake .#wiru@wiru

# installing paru
# sudo pacman -S rustup
# rustup default stable
# sudo rm -R ~/paru
# sudo pacman -S --needed base-devel
# git clone https://aur.archlinux.org/paru.git ~/paru
# cd ~/paru
# makepkg -si
# cd ~/dotfiles
# sudo rm -R ~/paru

# installing stuff that I dont like to install with nix
# paru -S --skipreview --noconfirm thorium-browser-bin
# paru -S --skipreview --noconfirm wezterm
# paru -S --skipreview --noconfirm zsh
# paru -S --skipreview --noconfirm rofi

# installing my own wm, by building from source.
# git clone https://github.com/wllfaria/lucky ~/lucky
# cd ~/lucky
# cargo build --release && cp ./target/release/lucky ~/.local/bin
# cd ~/dotfiles
# sudo rm -R ~/lucky

# setting up default shell
# chsh -s $(which zsh)

# installing nvidia drivers

