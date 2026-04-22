#!/usr/bin/env bash
# 一键启动本地 HTTP 服务并打开浏览器。双击此文件即可使用。
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR" || exit 1
PORT=8765
echo "→ 启动本地服务器 http://localhost:$PORT"
# 优先 Python 3，否则 Python 2
if command -v python3 >/dev/null 2>&1; then
  (sleep 0.7; open "http://localhost:$PORT/index.html") &
  python3 -m http.server $PORT
else
  (sleep 0.7; open "http://localhost:$PORT/index.html") &
  python -m SimpleHTTPServer $PORT
fi
