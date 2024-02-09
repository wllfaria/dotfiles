DIR=`pwd`
FONT_DIR="$HOME/.local/share/fonts"
ROFI_DIR="$HOME/.config/rofi"

echo -e ${BBlue}"\n[*] Installing fonts..." ${Color_Off}
if [[ -d "$FONT_DIR" ]]; then
    cp -rf $DIR/fonts/* "$FONT_DIR"
else
    mkdir -p "$FONT_DIR"
    cp -rf $DIR/fonts/* "$FONT_DIR"
fi
echo -e ${BYellow}"[*] Updating font cache...\n" ${Color_Off}
fc-cache
