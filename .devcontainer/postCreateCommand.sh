#!/bin/bash
set -e

# claude install by native installation (recommended)
# https://code.claude.com/docs/en/setup
echo "Installing Claude Code..."
if curl -fsSL https://claude.ai/install.sh | bash; then
    echo "✓ Claude Code installed successfully"
else
    echo "✗ Failed to install Claude Code. Please install manually: curl -fsSL https://claude.ai/install.sh | bash"
    echo "Continuing with container setup..."
fi

echo "Verifying installation..."
claude --version || echo "⚠️  Claude installed but requires authentication. Run 'claude' to authenticate."

echo ""
echo "⚠️  Post-setup required:"
echo "  1. Run: gh auth login"
echo "  2. Run: claude"
