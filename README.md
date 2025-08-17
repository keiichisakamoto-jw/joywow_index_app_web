# あなたのJOYWOW指数チェックアプリ (Flutter)

JOYWOWのミッション「ビジネスの世界に JOY + WOW + LOVE and FUN の総量を増やす」を進めるための、
ことだまチェック形式の自己診断アプリです。

- Yes/No で 50問（加点 27・減点 23）に答えるだけ
- スコア計算は「加点：Yesで +1」「減点：Yesで -1」「No は 0」
- 結果画面では JOYWOW指数 とメッセージを表示
- SNS にシェアできます（`share_plus`）
- 公式リンク（JOYWOW）へ遷移できます（`url_launcher`）
- 並び順はシャッフル/固定を選べます
- Flutter（iOS / Android / Web）対応

---

## セットアップ

1. Flutter 環境をご用意ください（3.10 以上推奨）。
2. このリポジトリのルートで以下を実行：

```bash
flutter pub get
flutter run
```

Web で試す場合：

```bash
flutter run -d chrome
```

本番ビルド：

```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

---

## フォルダ構成

```
lib/
  main.dart
  questions.dart
pubspec.yaml
README.md
```

---

## カスタマイズ

- 質問文の追加/編集は `lib/questions.dart` を編集してください。
- スコア判定基準（メッセージ閾値）は `lib/main.dart` の `_buildResultMessage` を調整してください。
- 公式リンクは `lib/main.dart` の `kOfficialLinks` を編集できます。

---

## ライセンス

MIT License
