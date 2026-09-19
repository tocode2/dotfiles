#!/bin/bash

set -e

DOTFILES="$HOME/dotfiles"

echo "=== Installing Dotfiles (copy mode) ==="

if [ ! -d "$DOTFILES" ]; then
  echo "Error: $DOTFILES does not exist."
  exit 1
fi

backup_existing() {
  local target="$1"
  if [ -L "$target" ]; then
    rm -f "$target"
  elif [ -e "$target" ]; then
    rm -rf "$target.backup"
    mv "$target" "$target.backup"
  fi
}

# ----------------------------------------
# Neovim / LazyVim
# ----------------------------------------

if [ -d "$DOTFILES/nvim" ]; then
  echo "[Neovim/LazyVim] Installing..."
  mkdir -p "$HOME/.config"
  backup_existing "$HOME/.config/nvim"
  cp -R "$DOTFILES/nvim" "$HOME/.config/nvim"
else
  echo "[Neovim/LazyVim] Skipped (no backup found)."
fi

# ----------------------------------------
# Ghostty
# ----------------------------------------

if [ -d "$DOTFILES/ghostty" ]; then
  echo "[Ghostty] Installing..."
  GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
  backup_existing "$GHOSTTY_DIR"
  mkdir -p "$GHOSTTY_DIR"
  cp -R "$DOTFILES/ghostty/"* "$GHOSTTY_DIR/"
else
  echo "[Ghostty] Skipped (no backup found)."
fi

# ----------------------------------------
# AeroSpace
# ----------------------------------------

if [ -f "$DOTFILES/aerospace/aerospace.toml" ]; then
  echo "[AeroSpace] Installing..."
  backup_existing "$HOME/.aerospace.toml"
  cp "$DOTFILES/aerospace/aerospace.toml" "$HOME/.aerospace.toml"
else
  echo "[AeroSpace] Skipped (no backup found)."
fi

echo ""
echo "=== Installation Complete ==="
echo "설정 적용을 위해 실행 중인 앱은 재시작하세요."
