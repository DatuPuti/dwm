#!/usr/bin/zsh

# this script completely removes LXQT
sudo apt remove --purge lxqt-core lxqt-session lxqt-panel lxqt-config lxqt-runner lxqt-policykit lxqt-sudo pcmanfm-qt lximage-qt openbox
sudo apt remove --purge lxqt task-lxqt-desktop
sudo apt autoremove --purge
sudo apt remove --purge lxqt-themes
sudo systemctl disable sddm
sudo apt remove --purge sddm

