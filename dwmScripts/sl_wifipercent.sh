#!/bin/sh
iface="$(ip -o link show up | awk -F': ' '/state UP/ && ($2 ~ /^wlan|^wlp/) {print $2; exit}')"
[ -n "$iface" ] || exit 0
ip -4 addr show dev "$iface" | awk '/inet / { sub(/\/.*/,"",$2); print $2; exit }' | {
read ip && printf "%s\n" "$ip"
}
