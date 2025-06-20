#!/bin/bash

# 流体力学講義資料をPDFに変換するスクリプト

echo "📄 流体力学講義資料をPDFに変換しています..."

# 入力ファイルと出力ファイルのパス
INPUT_FILE="/workspace/hydrodynamics/fluid_mechanics_introduction.md"
OUTPUT_FILE="/workspace/hydrodynamics/流体力学入門講義.pdf"

# PDF変換実行
pandoc "$INPUT_FILE" \
    -o "$OUTPUT_FILE" \
    --pdf-engine=xelatex \
    --variable mainfont="Noto Sans CJK JP" \
    --variable monofont="Noto Sans Mono CJK JP" \
    --variable geometry:margin=2.5cm \
    --variable fontsize=11pt \
    --variable documentclass=article \
    --variable linestretch=1.2 \
    --table-of-contents \
    --number-sections \
    --highlight-style=tango \
    --metadata title="流体力学入門講義" \
    --metadata author="自主ゼミ講義資料" \
    --metadata date="$(date '+%Y年%m月%d日')" \
    --verbose

if [ $? -eq 0 ]; then
    echo "✅ PDF変換が完了しました: $OUTPUT_FILE"
    echo "📊 ファイル情報:"
    ls -lh "$OUTPUT_FILE"
else
    echo "❌ PDF変換に失敗しました"
    exit 1
fi 