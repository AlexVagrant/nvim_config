#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

NVIM_CONFIG_DIR="$HOME/.config/nvim"
OLD_NVIM_CONFIG_DIR="$HOME/.config/nvim_old_$(date +%Y%m%d_%H%M%S)"

echo "Starting Neovim configuration setup..."

# 1. Backup existing Neovim configuration
# Only backup if the target directory exists and is not the current directory (where the script is run from).
if [ -d "$NVIM_CONFIG_DIR" ] && [ "$(realpath "$NVIM_CONFIG_DIR")" != "$(realpath "$(pwd)")" ]; then
  echo "Existing Neovim configuration found at $NVIM_CONFIG_DIR."
  echo "Backing it up to $OLD_NVIM_CONFIG_DIR..."
  mv "$NVIM_CONFIG_DIR" "$OLD_NVIM_CONFIG_DIR"
  echo "Backup complete."
fi

# Ensure the current directory is the target config directory
# This script assumes it's being run from within the cloned Neovim configuration directory.
# If it's not, the user should clone the repository first into ~/.config/nvim.
if [ "$(realpath "$(pwd)")" != "$(realpath "$NVIM_CONFIG_DIR")" ]; then
  echo "Error: This script should be run from within the Neovim configuration directory ($NVIM_CONFIG_DIR)."
  echo "Please clone the repository into $NVIM_CONFIG_DIR first, then run this script."
  exit 1
fi

# 2. Install lazy.nvim (if not already installed)
LAZY_NVIM_DIR="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_NVIM_DIR" ]; then
  echo "Installing lazy.nvim..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
    --branch=stable "$LAZY_NVIM_DIR"
  echo "lazy.nvim installed."
else
  echo "lazy.nvim already installed. Skipping."
fi

# 3. Run Neovim to install plugins
echo "Starting Neovim to install and synchronize plugins..."
# Ensure Neovim is in the PATH or provide instructions
if ! command -v nvim &> /dev/null
then
    echo "Neovim is not found in your PATH. Please install Neovim first."
    echo "For macOS, you can use: brew install neovim"
    echo "For other OS, please refer to Neovim's official installation guide."
    exit 1
fi

nvim --headless "+Lazy! sync" +qa

echo "Neovim configuration setup complete!"
echo "You can now start Neovim by typing 'nvim' in your terminal."