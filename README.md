# Diving into the Wired 🌊

Welcome to my dotfiles repository! This contains my personal configuration files, Hyprland setup, and documentation of my Arch Linux journey.

## 📁 Repository Structure

```
.
├── .config/              # Application configurations
│   ├── hypr/            # Hyprland window manager configs
│   ├── waybar/          # Status bar configuration
│   ├── kitty/           # Kitty terminal emulator
│   ├── alacritty/       # Alacritty terminal emulator
│   └── nvim/            # Neovim editor configuration
├── scripts/             # Utility scripts
│   ├── install.sh       # Dotfiles installation script
│   └── setup.sh         # System setup and package installation
├── wallpapers/          # Wallpaper collection
├── .bashrc              # Bash shell configuration
├── .zshrc               # Zsh shell configuration
└── .gitignore           # Git ignore rules
```

## 🚀 Quick Start

### Prerequisites

- Arch Linux installed
- `git` installed
- `sudo` privileges

### Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/DioFxcc/Diving-into-the-Wired.git
   cd Diving-into-the-Wired
   ```

2. **Run the setup script (fresh Arch install):**
   ```bash
   ./scripts/setup.sh
   ```
   This will install Hyprland and all necessary packages.

3. **Install dotfiles:**
   ```bash
   ./scripts/install.sh
   ```
   This creates symlinks from your home directory to the dotfiles in this repo.

4. **Log out and select Hyprland** from your display manager, or start it with:
   ```bash
   Hyprland
   ```

## 🎨 What's Included

### Window Manager
- **Hyprland** - Dynamic tiling Wayland compositor with smooth animations
- **hyprpaper** - Wallpaper utility for Hyprland
- **hyprlock** - Screen locker for Hyprland

### Status Bar
- **Waybar** - Highly customizable Wayland bar with system information
  - Workspace indicators
  - Window titles
  - Clock and date
  - System resources (CPU, Memory, Temperature)
  - Network status
  - Audio controls
  - Battery indicator

### Terminal Emulators
- **Kitty** - GPU-accelerated terminal with ligature support
- **Alacritty** - Fast, lightweight terminal emulator

### Shell Configuration
- **Bash** - Enhanced bash configuration with aliases and functions
- **Zsh** - Modern shell with completion and git integration

### Editor
- **Neovim** - Hyperextensible Vim-based text editor with modern defaults

### Theme
- **Catppuccin Mocha** - Soothing pastel color scheme applied across all applications

## ⌨️ Key Bindings

### Hyprland (SUPER = Windows/Command key)

| Keybinding | Action |
|------------|--------|
| `SUPER + Q` | Open terminal (Kitty) |
| `SUPER + C` | Close window |
| `SUPER + M` | Exit Hyprland |
| `SUPER + E` | Open file manager |
| `SUPER + V` | Toggle floating mode |
| `SUPER + R` | Open app launcher (wofi) |
| `SUPER + Arrow Keys` | Move focus |
| `SUPER + 1-9` | Switch to workspace 1-9 |
| `SUPER + SHIFT + 1-9` | Move window to workspace 1-9 |
| `SUPER + Mouse Left` | Move window |
| `SUPER + Mouse Right` | Resize window |
| `Print` | Screenshot area |
| `SHIFT + Print` | Screenshot full screen |

## 🛠️ Customization

### Change Wallpaper
1. Add your wallpaper to the `wallpapers/` directory
2. Edit `.config/hypr/hyprpaper.conf`:
   ```conf
   preload = ~/wallpapers/your-wallpaper.jpg
   wallpaper = ,~/wallpapers/your-wallpaper.jpg
   ```

### Modify Hyprland Settings
Edit `.config/hypr/hyprland.conf` to customize:
- Window gaps and borders
- Animations
- Key bindings
- Autostart applications
- Monitor configuration

### Customize Waybar
- **Appearance**: Edit `.config/waybar/style.css`
- **Modules**: Edit `.config/waybar/config`

### Terminal Colors
Both Kitty and Alacritty use the Catppuccin Mocha theme. To change:
- **Kitty**: Edit `.config/kitty/kitty.conf`
- **Alacritty**: Edit `.config/alacritty/alacritty.toml`

## 📦 Package List

### Core Packages
- `hyprland` - Window manager
- `waybar` - Status bar
- `kitty` / `alacritty` - Terminal emulators
- `neovim` - Text editor
- `wofi` - Application launcher

### System Utilities
- `pipewire` - Audio system
- `networkmanager` - Network management
- `brightnessctl` - Brightness control
- `grim` + `slurp` - Screenshot tools
- `wl-clipboard` - Clipboard utilities

### Fonts
- `ttf-jetbrains-mono-nerd` - Programming font with icons
- `ttf-font-awesome` - Icon font
- `noto-fonts` - System fonts
- `noto-fonts-emoji` - Emoji support

## 🔧 Troubleshooting

### Hyprland won't start
- Check if you have all required packages: `pacman -Q hyprland`
- Look at logs: `cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log`

### Waybar not showing
- Ensure Waybar is installed: `pacman -Q waybar`
- Check if it's running: `ps aux | grep waybar`
- Restart: `killall waybar && waybar &`

### Terminal not opening
- Check if Kitty is installed: `pacman -Q kitty`
- Try opening manually: `kitty` or `alacritty`

### Audio not working
- Start PipeWire: `systemctl --user start pipewire pipewire-pulse`
- Enable on boot: `systemctl --user enable pipewire pipewire-pulse`

## 📚 Resources

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Arch Wiki](https://wiki.archlinux.org/)
- [r/unixporn](https://www.reddit.com/r/unixporn/) - For inspiration
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Theme

## 📸 Screenshots

*Coming soon! Screenshots will be added as the setup evolves.*

## 🤝 Contributing

Feel free to fork this repository and adapt it to your needs! If you have suggestions or improvements, open an issue or pull request.

## 📝 License

This repository is provided as-is for personal use. Feel free to use and modify as you wish.

## 🙏 Acknowledgments

- The Hyprland community for an amazing compositor
- The Arch Linux community for excellent documentation
- Everyone who shares their dotfiles - you inspire us all!

---

**Happy ricing! 🎨**
