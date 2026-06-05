#!/bin/bash

case $BLOCK_BUTTON in
    1) notify-send "Memory Hoggers" "$(ps axch -o cmd:30,%mem --sort=-%mem | head)";;
esac

free -h | awk '/^Mem:/ {print $3}'

