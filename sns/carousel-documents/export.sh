#!/usr/bin/env bash
# 7枚を 1080×1350 の PNG に書き出す（Google Chrome のヘッドレスモードを使用）
set -e
cd "$(dirname "$0")"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
SRC="file:///$(pwd -W)/index.html"
mkdir -p png
for i in 1 2 3 4 5 6 7; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --window-size=1080,1350 --virtual-time-budget=8000 \
    --screenshot="$(pwd -W)/png/0$i.png" "$SRC?p=$i" 2>/dev/null
done
ls -la png
