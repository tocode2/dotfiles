#!/bin/bash

set -e

DOTFILES="$HOME/dotfiles"

echo "=== Dotfiles Backup ==="

mkdir -p "$DOTFILES"

# ----------------------------------------
# Ghostty
# ----------------------------------------

GHOSTTY_SRC="$HOME/Library/Application Support/com.mitchellh.ghostty"
GHOSTTY_DST="$DOTFILES/ghostty"

if [ -d "$GHOSTTY_SRC" ]; then
  echo "[Ghostty] Backing up..."
  rm -rf "$GHOSTTY_DST"
  mkdir -p "$GHOSTTY_DST"
  cp -R "$GHOSTTY_SRC/"* "$GHOSTTY_DST/" 2>/dev/null || true
else
  echo "[Ghostty] Config not found."
fi

# ----------------------------------------
# Neovim / LazyVim
# ----------------------------------------

NVIM_SRC="$HOME/.config/nvim"
NVIM_DST="$DOTFILES/nvim"

if [ -d "$NVIM_SRC" ]; then
  echo "[Neovim/LazyVim] Backing up..."
  rm -rf "$NVIM_DST"
  cp -R "$NVIM_SRC" "$NVIM_DST"
else
  echo "[Neovim] Config not found."
fi

# ----------------------------------------
# AeroSpace
# ----------------------------------------

AERO_SRC="$HOME/.aerospace.toml"
AERO_DST="$DOTFILES/aerospace/aerospace.toml"

if [ -f "$AERO_SRC" ]; then
  echo "[AeroSpace] Backing up..."
  mkdir -p "$DOTFILES/aerospace"
  cp "$AERO_SRC" "$AERO_DST"
else
  echo "[AeroSpace] Config not found."
fi

echo ""
echo "=== Backup Complete ==="
echo "Location: $DOTFILES"
