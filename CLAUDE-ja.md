# CLAUDE.md

[English](CLAUDE.md) | [日本語](CLAUDE-ja.md)

このファイルは、このリポジトリでコードを扱う際に Claude Code (claude.ai/code) にガイダンスを提供します。

## リポジトリ概要

これは、Python、Node.js、GitHub CLI、Claude Code での開発用に構成された DevContainer テンプレートリポジトリです。このリポジトリは、自動コードレビューや Issue/PR サポートのための Claude Code と GitHub Actions の統合を実演しています。

## 開発環境

### コンテナセットアップ

このリポジトリは、以下のスタックを持つ VSCode DevContainers を使用しています：
- **Python 3.13** - 最新の Python 開発環境
- **Node.js 20** - JavaScript/TypeScript 開発用
- **GitHub CLI** - GitHub との統合
- **Docker-in-Docker** - コンテナ内での Docker 操作
- **Claude Code 拡張機能** - プリインストールされた VSCode 拡張機能

### コンテナ作成後の認証

コンテナ作成後、以下の認証が必要です：

```bash
# GitHub CLI の認証
gh auth login

# Claude の認証
claude
```

注意: コンテナが再作成されると認証情報が失われるため、再実行が必要です。

### Claude Code の手動インストール

`postCreateCommand.sh` による自動インストールが失敗した場合：

```bash
npm install -g @anthropic-ai/claude-code
```

## GitHub Actions 統合

### Claude Code Action (claude.yml)

以下での `@claude` メンションに応答します：
- Issue コメント
- PR レビューコメント
- PR レビュー
- 新規 Issue（タイトルまたは本文内）

必要なシークレット: `CLAUDE_CODE_OAUTH_TOKEN`

必要な権限:
- `contents: read`
- `pull-requests: read`
- `issues: read`
- `id-token: write`
- `actions: read` (PR の CI 結果を読み取るため)

### 自動コードレビュー (claude-code-review.yml)

`opened` および `synchronize` イベントで PR を自動的にレビューします。

レビューの焦点:
- コード品質とベストプラクティス
- 潜在的なバグや問題
- パフォーマンスに関する考慮事項
- セキュリティ上の懸念
- テストカバレッジ

このワークフローは制限されたツール権限を使用します：
```
--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"
```

レビューは `gh pr comment` を介して PR コメントとして投稿されます。

## systemd に関する考慮事項

DevContainer 設定では systemd は無効になっています：
- systemd を有効にするには、Dockerfile で ENTRYPOINT 経由で起動されるコンテナを使用してください
- systemd が有効な場合、Docker-in-Docker 機能が動作しない可能性があります
- その場合、別途 Docker のインストールが必要になります

## ドキュメント標準

このリポジトリでドキュメントファイルを作成または更新する際：
- 常に英語版と日本語版の両方を作成してください
- 英語版: 標準のファイル名を使用（例: `README.md`、`CLAUDE.md`）
- 日本語版: 拡張子の前に `-ja` を付加（例: `README-ja.md`、`CLAUDE-ja.md`）
- 両言語版のコンテンツを同期して保持してください
- 適切な場合は、各ドキュメントの先頭に言語ナビゲーションリンクを含めてください

## 開発ワークフロー

このリポジトリでは、開発に **GitHub flow** を採用しています：

1. **ブランチを作成** - 各機能や修正のために `main` から新しいブランチを作成します
2. **コミットを行う** - 明確で説明的なメッセージでコミットを追加します
3. **Pull Request を開く** - 早期に PR を開いて変更を議論しフィードバックを得ます
4. **レビューと議論** - コードレビュープロセスで協力します
5. **デプロイとテスト** - マージ前にブランチで変更をテストします
6. **main にマージ** - 承認され、テストが通過したら `main` にマージします

主要な原則:
- `main` ブランチは常にデプロイ可能な状態を保つ
- 説明的なブランチ名を作成する（例: `feature/add-authentication`、`fix/login-bug`）
- 変更の「理由」を説明する明確なコミットメッセージを書く
- コードレビューと議論を促進するため、すべての変更に Pull Request を使用する
- レビューしやすいように、PR は焦点を絞り、適切なサイズに保つ

## GitHub Actions の操作

Claude Code ワークフローを変更する際：
- `claude.yml` ワークフローは `prompt` フィールドでカスタムプロンプトを受け付けます
- `claude-code-review.yml` ワークフローには事前定義されたレビュープロンプトがあります
- ツール権限は `claude_args` でカスタマイズできます
- オプションのフィルター（ファイルパス、PR 作成者など）を追加できます - ワークフロー内のコメント例を参照してください
