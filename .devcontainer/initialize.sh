#!/bin/bash
set -e

# Create authentication directories for GitHub CLI and Claude Code
# These directories will be mounted to persist credentials across container rebuilds

# Determine the home directory (Unix/WSL or Windows)
HOME_DIR="${HOME:-$USERPROFILE}"

# Create .config subdirectories
mkdir -p "$HOME_DIR/.config/gh" 2>/dev/null || true
mkdir -p "$HOME_DIR/.config/claude-code" 2>/dev/null || true

# Create .claude directory (actual Claude Code credentials location)
mkdir -p "$HOME_DIR/.claude" 2>/dev/null || true

# Create .claude.json file if it doesn't exist (actual authentication storage)
if [ -f "$HOME_DIR/.claude.json" ]; then
    echo "$HOME_DIR/.claude.json exists."
else
    echo "{}" > "$HOME_DIR/.claude.json"
fi

echo "Authentication directories and files ready: $HOME_DIR/.config/gh, $HOME_DIR/.config/claude-code, $HOME_DIR/.claude, $HOME_DIR/.claude.json"
