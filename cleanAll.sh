#!/usr/bin/zsh

TRUE=1
FALSE=0

DELETE_BIN=${FALSE}

case "$1" in
    --help|-h)
        echo "Usage: $0 [--with-bin]"
        echo "  --with-bin   Also delete installed executable"
        exit 0
        ;;
    --with-bin)
        DELETE_BIN=TRUE
        ;;
    "")
        # no args: normal cleanup including exe's
        ;;
        *)
        echo "Unknown option: $1"
        echo "Use --help for usage"
        exit 1
        ;;
esac

cd dmenu
make clean

cd ../dwm-6.8
make clean

cd ../slstatus-1.1
make clean

cd ../st-0.9.3
make clean

cd ..
if (( DELETE_BIN )); then
    sudo rm -rf /usr/local/bin/st
    sudo rm -rf /usr/local/bin/dwm
    sudo rm -rf /usr/local/bin/dmenu
    sudo rm -rf /usr/local/bin/slstatus
fi
