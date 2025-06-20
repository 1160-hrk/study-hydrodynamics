# 流体力学ゼミ講義資料 - PDF変換用Makefile

.PHONY: help pdf clean build open

# デフォルトターゲット
help:
	@echo "🧪 流体力学ゼミ講義資料 - 利用可能なコマンド"
	@echo ""
	@echo "📄 PDF変換:"
	@echo "  make pdf      - MarkdownファイルをPDFに変換"
	@echo ""
	@echo "🧹 メンテナンス:"
	@echo "  make clean    - 生成されたPDFファイルを削除"
	@echo "  make build    - Dockerイメージを再ビルド"
	@echo ""
	@echo "📖 閲覧:"
	@echo "  make open     - PDFファイルを開く（macOS）"
	@echo ""

# PDF変換
pdf:
	@echo "📄 流体力学講義資料をPDFに変換中..."
	@./convert_to_pdf.sh
	@echo "✅ PDF変換完了！"

# クリーンアップ
clean:
	@echo "🧹 生成されたPDFファイルを削除中..."
	@rm -f hydrodynamics/*.pdf
	@echo "✅ クリーンアップ完了！"

# Dockerイメージ再ビルド
build:
	@echo "🔨 Dockerイメージを再ビルド中..."
	@docker build -t pandoc-pdf .
	@echo "✅ ビルド完了！"

# PDF閲覧（macOS用）
open:
	@echo "📖 PDFファイルを開いています..."
	@if [ -f "hydrodynamics/流体力学入門講義.pdf" ]; then \
		open "hydrodynamics/流体力学入門講義.pdf"; \
	else \
		echo "❌ PDFファイルが見つかりません。先に 'make pdf' を実行してください。"; \
	fi

# 開発環境情報
info:
	@echo "ℹ️  開発環境情報:"
	@echo "   Pandoc version: $(shell pandoc --version | head -1)"
	@echo "   XeLaTeX available: $(shell which xelatex > /dev/null && echo 'Yes' || echo 'No')"
	@echo "   Japanese fonts: $(shell fc-list | grep -i noto | wc -l) fonts found" 