#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks from the home directory to the dotfiles in this repo

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where the script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}Starting dotfiles installation...${NC}"
echo -e "Dotfiles directory: ${DOTFILES_DIR}"

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if target already exists
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo -e "${YELLOW}Warning: $target already exists${NC}"
        read -p "Do you want to backup and replace it? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv "$target" "${target}.backup.$(date +%Y%m%d_%H%M%S)"
            echo -e "${GREEN}Backed up existing file${NC}"
        else
            echo -e "${YELLOW}Skipping $target${NC}"
            return
        fi
    fi
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Create symlink
    ln -s "$source" "$target"
    echo -e "${GREEN}Created symlink: $target -> $source${NC}"
}

# Link .config directory contents
echo -e "\n${GREEN}Linking .config files...${NC}"
if [ -d "$DOTFILES_DIR/.config" ]; then
    for config_dir in "$DOTFILES_DIR/.config"/*; do
        if [ -d "$config_dir" ]; then
            config_name=$(basename "$config_dir")
            create_symlink "$config_dir" "$HOME/.config/$config_name"
        fi
    done
fi

# Link shell configurations
echo -e "\n${GREEN}Linking shell configurations...${NC}"
for file in .bashrc .zshrc; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        create_symlink "$DOTFILES_DIR/$file" "$HOME/$file"
    fi
done

# Create wallpapers directory
echo -e "\n${GREEN}Setting up wallpapers directory...${NC}"
if [ ! -d "$HOME/wallpapers" ]; then
    ln -s "$DOTFILES_DIR/wallpapers" "$HOME/wallpapers"
    echo -e "${GREEN}Created wallpapers directory link${NC}"
else
    echo -e "${YELLOW}Wallpapers directory already exists${NC}"
fi

# Make scripts executable
echo -e "\n${GREEN}Making scripts executable...${NC}"
if [ -d "$DOTFILES_DIR/scripts" ]; then
    chmod +x "$DOTFILES_DIR/scripts"/*.sh 2>/dev/null || true
fi

echo -e "\n${GREEN}Dotfiles installation complete!${NC}"
echo -e "${YELLOW}Note: You may need to restart your shell or source your shell config:${NC}"
echo -e "  source ~/.bashrc  # for bash"
echo -e "  source ~/.zshrc   # for zsh"
