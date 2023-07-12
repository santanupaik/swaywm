#!/bin/sh
echo
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
read -p "Update the System & install all the required packages ? (y/n): " ans

case $ans in
    y|Y)
    	echo
        echo "Preparing for System Upgrade..."
        sleep 1s
    ;;
    n|N)
    	echo
        echo "Aborting..."
        echo
	exit 0
    ;;
    *)
    	echo
	echo "Invalid Choice."
	echo
	exit 0
    ;;
esac
echo
sudo pacman -Syu --noconfirm
echo
echo "Installing all the Required Packages..."
sleep 1s
echo
sudo pacman -S --noconfirm xdg-desktop-portal 
sudo pacman -S --noconfirm mesa wayland sway swaylock swayidle swaybg fuzzel waybar gvfs alacritty thunar fragments firefox chromium celluloid gvfs-smb torbrowser-launcher firejail pipewire pipewire-pulse gvfs-mtp gsettings-desktop-schemas pamixer pavucontrol otf-font-awesome grim slurp swappy xdg-desktop-portal-wlr
sleep 1s
echo
echo "Success !!"
echo