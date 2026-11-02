#!/usr/bin/env bash
# 5枚を 1440×1080（4:3）の PNG に書き出す（Google Chrome のヘッドレスモードを使用）
# ※ png/ は Canva で仕上げた最終版。上書きしないよう export/ に書き出す
set -e
cd "$(dirname "$0")"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
SRC="file:///$(pwd -W)/index.html"
mkdir -p export
for i in 1 2 3 4 5; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --window-size=1440,1080 --virtual-time-budget=8000 \
    --screenshot="$(pwd -W)/export/0$i.png" "$SRC?p=$i" 2>/dev/null
done
ls -la export
