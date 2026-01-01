echo "[Phoenix] Installing Network Manager..."
sudo pacman -S networkmanager
echo "[Phoenix] Enabling Network Manager service..."
sudo systemctl enable NetworkManager
echo "[Phoenix] Network Manager service has been enabled."