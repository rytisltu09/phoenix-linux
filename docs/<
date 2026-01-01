# Phoenix Linux Installation Guide

Phoenix Linux is a terminal-based, minimal, and security based OS.
This will guide you on how to install Phoenix Linux on your system.

## Philosophy:
  1. Minimal - Only what you need
  2. Plug & Play - Works right out of the box
  3. Start small, build yourself - Complete freedom over your own environment

## Minimum Requirements:
  1. 500 MiB RAM
  2. 5 GB Free disk space
  3. UEFI or Legacy BIOS
  4. Bootable Phoenix Linux ISO

1. Flash the ISO to a USB drive using your preferred tool:
   - Linux: `dd if=phoenix-linux.iso of=/dev/sdX bs=4M status=progress`
   - Windows: Rufus
   - Mac: `dd` or balenaEtcher

2. Insert USB and boot from it:
   - Access your BIOS/UEFI boot menu
   - Select USB device
   - You will land in a Phoenix Linux TTY

 Phoenix Linux requires a clean target drive. 
Use `cfdisk` or `fdisk` to partition:

Example for UEFI systems:

/dev/sda1  512M   EFI System
/dev/sda2  rest   Linux filesystem

Format partitions:
sudo mkfs.fat -F32 /dev/sda1
sudo mkfs.ext4 /dev/sda2

Mount:
sudo mount /dev/sda2 /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/sda1 /mnt/boot

Use `pacstrap` to install Phoenix Linux base:

sudo pacstrap /mnt \
  base \
  linux \
  linux-firmware \
  bash \
  vim \
  coreutils \
  iproute2 \
  iputils \
  net-tools \
  openssh \
  sudo \
  git \
  nano

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into your system
arch-chroot /mnt

# Set timezone
timedatectl set-timezone [YOUR_TIMEZONE]

# Set locale
vim /etc/locale.gen
# uncomment en_US.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Hostname
echo "phoenix" > /etc/hostname
vim /etc/hosts
# add:
127.0.0.1 localhost
::1       localhost
127.0.1.1 phoenix.localdomain phoenix

# Root password
passwd

# Create user
useradd -m -G wheel -s /bin/bash phoenix
passwd phoenix
EDITOR=vim visudo
# uncomment %wheel ALL=(ALL:ALL) ALL

# Install NetworkManager
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager

# Install GRUB (UEFI example)
sudo pacman -S grub efibootmgr
sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=PHOENIX
sudo grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
reboot

# Remove the USB
# Login as phoenix

sudo pacman -S \
  nmap \
  tcpdump \
  tshark \
  hydra \
  gobuster \
  sqlmap \
  john \
  hashcat \
  aircrack-ng

# Optional modules
sudo pacman -S metasploit

After doing so, you now have Phoenix Linux Base.
