#!/usr/bin/env bash

STEP=${STEP:-5}

case $BLOCK_BUTTON in
    3) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    4) wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%+ ;;
    5) wpctl set-volume @DEFAULT_AUDIO_SINK@ ${STEP}%- ;;
esac

output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
# output looks like: "Volume: 0.50" or "Volume: 0.50 [MUTED]"

if echo "$output" | grep -q MUTED; then
    echo "MUTE"
else
    vol=$(echo "$output" | awk '{printf "%d", $2 * 100}')
    echo "${vol}"
fi
