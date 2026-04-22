# Skill 实践指南 · 有声 PPT

基于 Figma 设计稿「Cursor-Test · Skill 实践指南」制作的有声播放网页，
包含 18 页幻灯片 + 讲稿 + 云希（中文男声）TTS 语音。

## 快速开始

**方式 1：双击 `start.command`（推荐）**
会自动启动本地服务器并在浏览器打开。

**方式 2：手动启动**
```bash
cd ~/Desktop/ai-skill-ppt
python3 -m http.server 8765
# 浏览器访问 http://localhost:8765/index.html
```

> 由于浏览器安全策略，`file://` 直接打开可能无法加载讲稿 JSON。
> 通过本地 HTTP 服务器打开可避免此问题。

## 使用说明

- **空格键**：播放 / 暂停
- **← →**：上一页 / 下一页
- **全览按钮**：打开缩略图选择任意页
- **讲稿按钮**：底部滑出讲稿面板
- **自动翻页**：默认开启，音频播放完毕自动进入下一页
- **全屏按钮**：进入演示模式

## 目录结构

```
ai-skill-ppt/
├── index.html              # 主页面（18 页幻灯片 + 播放器）
├── start.command           # 一键启动脚本
├── scripts/
│   ├── scripts.json        # 18 页讲稿
│   └── gen_audio.py        # TTS 音频生成脚本
├── audio/
│   └── slide-01.mp3 … slide-18.mp3   # 男声语音（云希 · zh-CN-YunxiNeural）
└── venv/                   # Python 虚拟环境（edge-tts）
```

## 重新生成音频

若需修改讲稿后重新合成音频：

```bash
cd ~/Desktop/ai-skill-ppt
# 编辑 scripts/scripts.json
source venv/bin/activate
python scripts/gen_audio.py
```

## 更换男声

编辑 `scripts/gen_audio.py` 顶部的 `VOICE` 值：

| Voice                   | 风格                  |
| ----------------------- | --------------------- |
| `zh-CN-YunxiNeural`     | 云希 · 年轻、清爽（当前） |
| `zh-CN-YunjianNeural`   | 云健 · 沉稳、播音腔      |
| `zh-CN-YunyangNeural`   | 云扬 · 新闻专业播报      |
| `zh-CN-YunxiaNeural`    | 云夏 · 轻快、卡通感      |

调整语速 / 音调可修改 `RATE` / `PITCH`，例如 `RATE = "+10%"`。
