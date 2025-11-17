# DevContainer Setup

This DevContainer provides a development environment with Python, Node.js, GitHub CLI, and Claude Code.

[日本語版はこちら](README-ja.md)

## Initial Setup

After container creation, authentication is required:

1. **GitHub CLI Authentication**
   ```bash
   gh auth login
   ```

2. **Claude Authentication**
   ```bash
   claude
   ```

## Included Features

- **Python 3.13** - Latest Python development environment
- **Node.js 20** - For JavaScript/TypeScript development
- **GitHub CLI** - GitHub integration
- **Docker-in-Docker** - Docker operations within the container
- **Claude Code Extension** - Use Claude in VSCode

## About systemd

systemd is disabled in this DevContainer configuration.

- To enable systemd, you need to use a container that starts via ENTRYPOINT in a Dockerfile
- The Docker-in-Docker feature may not work when systemd is enabled
- In such cases, separate Docker installation is required

## Troubleshooting

### If Claude Code Installation Fails

Install manually:

```bash
npm install -g @anthropic-ai/claude-code
```

### If Authentication is Lost

When the container is recreated, authentication is lost and re-authentication is required:

```bash
gh auth login
claude
```
