# 流体力学ゼミ・PDF変換用開発環境
FROM ubuntu:22.04

# 非対話的インストールの設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# 基本パッケージとpandocのインストール
RUN apt-get update && apt-get install -y \
    # 基本ツール
    curl \
    wget \
    git \
    vim \
    nano \
    tree \
    # pandocとPDF変換ツール
    pandoc \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-japanese \
    texlive-xetex \
    # 日本語フォント
    fonts-noto-cjk \
    fonts-noto-cjk-extra \
    # その他のツール
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /workspace

# PDF変換スクリプトをコピー
COPY convert_to_pdf.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/convert_to_pdf.sh

# 便利なエイリアスを設定
RUN echo 'alias ll="ls -la"' >> /root/.bashrc && \
    echo 'alias pdf="convert_to_pdf.sh"' >> /root/.bashrc && \
    echo 'echo "🧪 流体力学ゼミ環境へようこそ！"' >> /root/.bashrc && \
    echo 'echo "📄 PDF変換: pdf または convert_to_pdf.sh"' >> /root/.bashrc

# デフォルトコマンド
CMD ["bash"] 