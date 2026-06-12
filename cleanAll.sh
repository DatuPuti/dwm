#!/usr/bin/zsh


cd dmenu
make clean
sudo rm -rf /usr/local/bin/dmenu

cd ../dwm-6.8
make clean
sudo rm -rf /usr/local/bin/dwm

cd ../slstatus-1.1
make clean
sudo rm -rf /usr/local/bin/slstatus

cd ../st-0.9.3
make clean
sudo rm -rf /usr/local/bin/st

