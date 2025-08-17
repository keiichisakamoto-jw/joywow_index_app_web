# JOYWOW指数チェック（GitHub Pages 最速デプロイ用）

このフォルダ（`docs/`）を **リポジトリ直下**に置き、GitHub Pages の Source を `main` / `/docs` に設定すれば公開されます。

- 公開URLの例: `https://<ユーザー名>.github.io/<REPO_NAME>/`
- Flutter ビルドは不要の **ゼロビルド静的版**（HTML/JSのみ）です
- Flutter 版は別途進めたい場合も、まずはこれで「公開体験」を最短に作れます

## 手順（3 ステップ）
1. この `docs/` フォルダをリポジトリ直下に置いて commit & push
2. GitHub → Settings → Pages → Source: `Deploy from a branch` / Branch: `main` / Folder: `/docs`
3. 数十秒後に発行される URL にアクセス

## 使い方
- 質問文やメッセージ閾値は `docs/index.html` 内のスクリプト配列を編集してください。
