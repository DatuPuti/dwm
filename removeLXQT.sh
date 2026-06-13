#!/usr/bin/zsh

# before running this script, login and
# Ctrl + Alt + F3

echo "Switching to TTY-only mode and stopping display manager..."

# Stop Lubuntu's display manager (SDDM)
sudo systemctl stop sddm 2>/dev/null
sudo systemctl disable sddm 2>/dev/null

# Stop other possible DMs just in case
sudo systemctl stop lightdm 2>/dev/null
sudo systemctl disable lightdm 2>/dev/null

sudo systemctl stop lxdm 2>/dev/null
sudo systemctl disable lxdm 2>/dev/null

echo "Removing LXQt packages..."

sudo apt remove --purge -y \
    lxqt-core \
    lxqt-session \
    lxqt-panel \
    lxqt-config \
    lxqt-runner \
    lxqt-policykit \
    lxqt-sudo \
    pcmanfm-qt \
    lximage-qt \
    openbox \
    lxqt \
    lubuntu-desktop \
    task-lxqt-desktop

echo "Cleaning up unused dependencies..."

sudo apt autoremove --purge -y

echo "Ensuring dwm starts via startx..."

# Create .xinitrc only if it doesn't exist
if [ ! -f "$HOME/.xinitrc" ]; then
    echo "exec dwm" > "$HOME/.xinitrc"
fi

echo "LXQt removed. Reboot recommended."
