# dotfiles

個人的な開発環境設定ファイル集

## ディレクトリ構成

```
dotfiles/
├── README.md              # このファイル
└── vscode/               # Visual Studio Code の設定
    └── keybindings.json  # VSCode キーバインド設定
```

## 各ファイルの役割

### vscode/keybindings.json
Visual Studio Code のカスタムキーバインド設定ファイル

主な設定内容：
- **ターミナル操作**
  - `Cmd+Backspace`: アクティブなターミナルタブを削除
  - `Shift+Cmd+\`: 新しいターミナルを開く
  - `Shift+Cmd+Backspace`: ターミナルエディタ/プロセスを終了
- **エディタナビゲーション**
  - `Cmd+Shift+[`: 前のエディタに移動（ターミナル以外）
  - `Cmd+Shift+]`: 次のエディタに移動（ターミナル以外）

これらの設定により、より効率的なターミナル操作とエディタ間の移動が可能になります。