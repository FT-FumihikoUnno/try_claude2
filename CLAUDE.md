# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a DevContainer template repository configured for development with Python, Node.js, GitHub CLI, and Claude Code. The repository demonstrates GitHub Actions integration with Claude Code for automated code reviews and issue/PR assistance.

## Development Environment

### Container Setup

The repository uses VSCode DevContainers with the following stack:
- **Python 3.13** - Latest Python development environment
- **Node.js 20** - For JavaScript/TypeScript development
- **GitHub CLI** - GitHub integration
- **Docker-in-Docker** - Docker operations within the container
- **Claude Code Extension** - Pre-installed VSCode extension

### Post-Container Authentication

After container creation, authentication is required:

```bash
# GitHub CLI authentication
gh auth login

# Claude authentication
claude
```

Note: Authentication is lost when the container is recreated and must be re-run.

### Manual Claude Code Installation

If the automatic installation via `postCreateCommand.sh` fails:

```bash
npm install -g @anthropic-ai/claude-code
```

## GitHub Actions Integration

### Claude Code Action (claude.yml)

Responds to `@claude` mentions in:
- Issue comments
- PR review comments
- PR reviews
- New issues (in title or body)

Required secret: `CLAUDE_CODE_OAUTH_TOKEN`

Permissions required:
- `contents: read`
- `pull-requests: read`
- `issues: read`
- `id-token: write`
- `actions: read` (for reading CI results on PRs)

### Automated Code Review (claude-code-review.yml)

Automatically reviews PRs on `opened` and `synchronize` events.

Review focuses on:
- Code quality and best practices
- Potential bugs or issues
- Performance considerations
- Security concerns
- Test coverage

The workflow uses restricted tool permissions:
```
--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"
```

Reviews are posted as PR comments via `gh pr comment`.

## systemd Considerations

systemd is disabled in the DevContainer configuration:
- To enable systemd, use a container started via ENTRYPOINT in a Dockerfile
- Docker-in-Docker feature may not work when systemd is enabled
- Separate Docker installation would be required in that case

## Documentation Standards

When creating or updating documentation files in this repository:
- Always create both English and Japanese versions
- English version: Use standard filename (e.g., `README.md`, `CLAUDE.md`)
- Japanese version: Append `-ja` before the extension (e.g., `README-ja.md`, `CLAUDE-ja.md`)
- Keep content synchronized between both language versions
- Include language navigation links at the top of each document when appropriate

## Working with GitHub Actions

When modifying the Claude Code workflows:
- The `claude.yml` workflow accepts custom prompts via the `prompt` field
- The `claude-code-review.yml` workflow has a predefined review prompt
- Tool permissions can be customized via `claude_args`
- Optional filters can be added (file paths, PR authors) - see commented examples in the workflows
