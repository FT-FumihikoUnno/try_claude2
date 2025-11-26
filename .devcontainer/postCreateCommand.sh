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
echo "ℹ️  Authentication (if needed):"
echo "  Credentials are persisted across container rebuilds."
echo "  If not already authenticated, run:"
echo "    - gh auth login"
echo "    - claude"
