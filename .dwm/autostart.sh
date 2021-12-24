#! /bin/bash

# Paperview parameters order
# d - Animation Duration
# x - X Position
# y - Y Position
# w - Width
# h - Height
# paperview ~/wallpapers/animated/girl 10 0 0 1920 1080 ~/wallpapers/animated/girl 10 1920 0 1920 1080 &

compton --config ~/.config/compton/compton.conf &
nitrogen --restore &
# xwinwrap -ov -g 1920x1080+0+0 -- mpv -wid WID ~/wallpapers/animated/street.gif --loop-file --no-osc &
# xwinwrap -ov -g 1920x1080+1920+0 -- mpv -wid WID ~/wallpapers/animated/street.gif --loop-file --no-osc &


# Display the current date on DWM status bar
function display_date() {
    d="$(date +"%H:%M - %d %b")"
    echo -e " $d"
}

# Display the current memory usage on DWM status bar
function memory_usage() {
    local memory_usage=`free | awk '/Mem/ {printf "%d M/%d M\n", $3 / 1024.0, $2 / 1024.0}'`
    echo -e "﫭 $memory_usage"
}

function cpu_usage() {
    cpu=$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]
    echo -e " $cpu% CPU"
}

# Call all functions periodically
while true; do
    xsetroot -name "$(cpu_usage) | $(memory_usage) | $(display_date)        "
    sleep 10s
done &
