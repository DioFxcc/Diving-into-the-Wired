#!/bin/bash

# Arch Linux Hyprland Setup Script
# This script installs essential packages for a Hyprland setup

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Arch Linux Hyprland Setup${NC}"
echo -e "${BLUE}================================${NC}\n"

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    echo -e "${RED}Error: This script is designed for Arch Linux${NC}"
    exit 1
fi

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}Error: Do not run this script as root${NC}"
    exit 1
fi

echo -e "${YELLOW}This script will install packages for a complete Hyprland setup.${NC}"
read -p "Do you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation cancelled${NC}"
    exit 0
fi

# Update system
echo -e "\n${GREEN}Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install Hyprland and core components
echo -e "\n${GREEN}Installing Hyprland and core components...${NC}"
sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprpaper \
    hyprlock \
    hypridle \
    xdg-desktop-portal-hyprland

# Install Waybar and dependencies
echo -e "\n${GREEN}Installing Waybar...${NC}"
sudo pacman -S --needed --noconfirm \
    waybar \
    otf-font-awesome

# Install terminal emulators
echo -e "\n${GREEN}Installing terminal emulators...${NC}"
sudo pacman -S --needed --noconfirm \
    kitty \
    alacritty

# Install shell and utilities
echo -e "\n${GREEN}Installing shell and utilities...${NC}"
sudo pacman -S --needed --noconfirm \
    zsh \
    bash-completion \
    neovim \
    git \
    wget \
    curl

# Install audio
echo -e "\n${GREEN}Installing audio system...${NC}"
sudo pacman -S --needed --noconfirm \
    pipewire \
    pipewire-audio \
    pipewire-pulse \
    pipewire-alsa \
    pipewire-jack \
    wireplumber \
    pavucontrol

# Install file manager and utilities
echo -e "\n${GREEN}Installing utilities...${NC}"
sudo pacman -S --needed --noconfirm \
    dolphin \
    thunar \
    ranger \
    neofetch \
    htop \
    btop

# Install screenshot and clipboard
echo -e "\n${GREEN}Installing screenshot and clipboard tools...${NC}"
sudo pacman -S --needed --noconfirm \
    grim \
    slurp \
    wl-clipboard \
    cliphist

# Install app launcher
echo -e "\n${GREEN}Installing application launcher...${NC}"
sudo pacman -S --needed --noconfirm \
    wofi \
    rofi-wayland

# Install network manager
echo -e "\n${GREEN}Installing network manager...${NC}"
sudo pacman -S --needed --noconfirm \
    networkmanager \
    network-manager-applet

# Enable NetworkManager service
echo -e "\n${GREEN}Enabling NetworkManager service...${NC}"
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Install fonts
echo -e "\n${GREEN}Installing fonts...${NC}"
sudo pacman -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd \
    ttf-font-awesome \
    noto-fonts \
    noto-fonts-emoji

# Install brightness control
echo -e "\n${GREEN}Installing brightness control...${NC}"
sudo pacman -S --needed --noconfirm \
    brightnessctl

# Install notification daemon
echo -e "\n${GREEN}Installing notification daemon...${NC}"
sudo pacman -S --needed --noconfirm \
    mako

echo -e "\n${GREEN}================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Run the install.sh script to symlink dotfiles"
echo -e "2. Log out and select Hyprland from your display manager"
echo -e "3. Or start Hyprland with: Hyprland"
echo -e "\n${YELLOW}Optional:${NC}"
echo -e "- Install yay for AUR access: ${BLUE}https://github.com/Jguer/yay${NC}"
echo -e "- Add wallpapers to ~/wallpapers/"
echo -e "- Customize configurations in ~/.config/"
