#!/bin/bash
# 在本文件夹启动静态服务，用于预览带样式的 Markdown（避免 file:// 无法加载 .md）
cd "$(dirname "$0")"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  预览地址（复制到浏览器打开）："
echo "  → http://localhost:8765/index.html"
echo ""
echo "  停服：在本窗口按 Ctrl + C"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
(sleep 0.6 && open "http://localhost:8765/index.html" 2>/dev/null) &
exec python3 -m http.server 8765
