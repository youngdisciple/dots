#!/bin/bash

right_monitor="Acer Technologies KA242Y 10520319E3P00"
left_monitor="Dell Inc. DELL P2419H HRTY1Y2"
laptop_monitor="Chimei Innolux Corporation 0x143C Unknown"

is_connected() {
    swaymsg -t get_outputs -r | jq -e --arg name "$1" '
        any(.[]; "\(.make) \(.model) \(.serial)" == $name)
    ' > /dev/null
}

if is_connected "$right_monitor" && is_connected "$left_monitor"; then
    swaymsg "output \"$left_monitor\" position 0 0"
    swaymsg "output \"$right_monitor\" position 1920 0"
    swaymsg "output \"$laptop_monitor\" power off"
    swaymsg "workspace 1; move workspace to output \"$left_monitor\""
    swaymsg "workspace 2; move workspace to output \"$left_monitor\""
    swaymsg "workspace 3; move workspace to output \"$left_monitor\""
    swaymsg "workspace 4; move workspace to output \"$right_monitor\""
    swaymsg "workspace 5; move workspace to output \"$right_monitor\""
fi
