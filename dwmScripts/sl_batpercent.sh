#!/bin/sh
batdir="/sys/class/power_supply"
[ -d "$batdir" ] || exit 0
bat="$(ls "$batdir" | grep -E '^BAT|^BAT0' | head -n1)"
[ -n "$bat" ] || exit 0
cat "$batdir/$bat/capacity" 2>/dev/null | tr -d '\n' && echo
