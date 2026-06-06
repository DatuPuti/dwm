#!/bin/sh

IF="$(ip -o link show up | awk -F': ' '/state UP/ {print $2; exit}')"

# first UP interface
case "$IF" in
  wlan*|wlp*)
    iface="$IF"
    ;;
  eth*|enp*|end*)
    iface="$IF"
    ;;
  *)
    iface=""
    ;;
esac

if [ -n "$iface" ]; then
  ip -4 addr show dev "$iface" | awk '/inet / { sub(/\/.*/,"",$2); printf("%s", $2); exit }'
fi

