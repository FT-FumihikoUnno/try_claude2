#!/bin/bash
set -e

# Create authentication directories for GitHub CLI and Claude Code
# These directories will be mounted to persist credentials across container rebuilds

# Determine the config base directory (Unix/WSL or Windows)
CONFIG_DIR="${HOME:-$USERPROFILE}/.config"

# Create directories (silently skip if they already exist)
mkdir -p "$CONFIG_DIR/gh" 2>/dev/null || true
mkdir -p "$CONFIG_DIR/claude-code" 2>/dev/null || true

echo "Authentication directories ready: $CONFIG_DIR/gh, $CONFIG_DIR/claude-code"
