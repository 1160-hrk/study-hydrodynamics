# 流体力学ゼミ講義資料

プロの理論物理学者による流体力学の自主ゼミ用講義資料プロジェクトです。

## 📚 内容

- **流体粒子と座標系の定義**: ラグランジュ・オイラー座標系
- **ラグランジュ微分とオイラー微分**: 物質微分の物理的意味
- **流線と流量の定義**: 流体運動の可視化概念
- **連続方程式の導出**: 質量保存則の数学的定式化
- **運動方程式の導出**: オイラー方程式とナビエ・ストークス方程式

## 🚀 Dev Container環境での使用方法

### 前提条件

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Dev Containers拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### 環境構築手順

1. **このプロジェクトをクローン/開く**
   ```bash
   git clone <repository-url>
   cd jishu-zemi
   ```

2. **VS CodeでDev Containerを起動**
   - VS Codeでプロジェクトフォルダを開く
   - `Ctrl+Shift+P` (macOS: `Cmd+Shift+P`) でコマンドパレットを開く
   - `Dev Containers: Reopen in Container` を選択
   - 初回起動時は自動的にDockerイメージがビルドされます

3. **環境の確認**
   ```bash
   # 利用可能なコマンドを確認
   make help
   
   # 環境情報を確認
   make info
   ```

### PDF変換の実行

#### 方法1: Makefileを使用（推奨）
```bash
# PDF変換を実行
make pdf

# PDFファイルを開く（macOS）
make open

# 生成されたPDFファイルを削除
make clean
```

#### 方法2: 直接スクリプトを実行
```bash
# PDF変換スクリプトを実行
./convert_to_pdf.sh

# または短縮コマンド
pdf
```

#### 方法3: pandocコマンドを直接使用
```bash
pandoc hydrodynamics/fluid_mechanics_introduction.md \
    -o hydrodynamics/流体力学入門講義.pdf \
    --pdf-engine=xelatex \
    --variable mainfont="Noto Sans CJK JP" \
    --table-of-contents \
    --number-sections
```

## 📁 ファイル構成

```
jishu-zemi/
├── .devcontainer/
│   └── devcontainer.json          # Dev Container設定
├── hydrodynamics/
│   ├── fluid_mechanics_introduction.md  # 講義資料（Markdown）
│   └── 流体力学入門講義.pdf       # 生成されるPDF
├── Dockerfile                     # Docker環境定義
├── Makefile                       # 便利なコマンド集
├── convert_to_pdf.sh             # PDF変換スクリプト
└── README.md                     # このファイル
```

## 🛠️ 開発環境の特徴

### インストール済みツール
- **pandoc**: Markdown→PDF変換エンジン
- **XeLaTeX**: 高品質なPDF生成
- **日本語フォント**: Noto Sans CJK JP
- **LaTeX packages**: 数式・表・図表対応
- **開発ツール**: git, vim, nano, tree

### VS Code拡張機能
- **Markdown All in One**: Markdown編集支援
- **Markdown Preview Enhanced**: プレビュー機能強化
- **LaTeX Workshop**: LaTeX編集支援

### 便利なエイリアス
- `pdf`: PDF変換の実行
- `ll`: 詳細ファイル一覧

## 🎨 PDF出力の特徴

- **日本語対応**: Noto Sans CJK JPフォント使用
- **数式表示**: LaTeX数式の美しいレンダリング
- **目次自動生成**: セクション番号付き
- **コードハイライト**: Tangoテーマ
- **適切な余白**: 読みやすいレイアウト

## 🔧 カスタマイズ

### フォントの変更
`convert_to_pdf.sh` の `--variable mainfont` オプションを変更:
```bash
--variable mainfont="Source Han Sans JP"
```

### レイアウトの調整
```bash
--variable geometry:margin=3cm        # 余白調整
--variable fontsize=12pt             # フォントサイズ
--variable linestretch=1.5           # 行間調整
```

### テーマの変更
```bash
--highlight-style=github             # コードハイライトテーマ
```

## 📖 講義資料の編集

1. `hydrodynamics/fluid_mechanics_introduction.md` を編集
2. VS Codeのプレビュー機能で確認
3. `make pdf` でPDF生成
4. `make open` で結果確認

## 🤝 貢献

1. フォークを作成
2. フィーチャーブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add some amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 📝 ライセンス

教育目的での使用を想定しています。詳細はプロジェクト管理者にお問い合わせください。

---

**Happy Learning! 🧪✨** 