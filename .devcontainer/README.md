# DevContainer セットアップ

このDevContainerは、Python、Node.js、GitHub CLI、Claude Codeを含む開発環境を提供します。

## 初回セットアップ

コンテナ作成後、以下の認証が必要です：

1. **GitHub CLI の認証**
   ```bash
   gh auth login
   ```

2. **Claude の認証**
   ```bash
   claude
   ```

## 含まれる機能

- **Python 3.14** - 最新の Python 開発環境
- **Node.js 20** - JavaScript/TypeScript 開発用
- **GitHub CLI** - GitHub との統合
- **Docker-in-Docker** - コンテナ内での Docker 操作
- **Claude Code 拡張機能** - VSCode で Claude を使用可能

## systemd について

このDevContainer設定では、systemd は無効になっています。

- systemd を有効にする場合は、Dockerfile等でENTRYPOINTによって起動するコンテナを使う必要があります
- Docker-in-Docker のfeature は、systemd有効時には使えなくなる可能性があります
- その場合は、別途 docker のインストールが必要になります

## トラブルシューティング

### Claude Code のインストールに失敗する場合

手動でインストールしてください：

```bash
npm install -g @anthropic-ai/claude-code
```

### 認証情報が失われた場合

コンテナを再作成すると認証情報が失われるため、再度認証が必要になります：

```bash
gh auth login
claude
```
