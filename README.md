# SSC Design Skill Hub

设计团队 **Skill** 导航站：卡片介绍、一键安装 Prompt、**Skill 实践指南**（有声 PPT）、以及 **Markdown 撰写模板** 的在线预览。

## 在线访问（GitHub Pages）

1. 在仓库 **Settings → Pages** 中，将 **Build and deployment** 设为 **Deploy from a branch**。
2. **Branch** 选择 `main`，文件夹选 **`/ (root)`**，保存。
3. 等待一分钟左右，站点地址一般为：

   **`https://shopeedesign.github.io/ssc-design-skill-hub/`**

   （若仓库名不同，请将路径中的 `ssc-design-skill-hub` 换成你的仓库名。）

首页页脚可打开：

- **Skill 实践指南**（`docs/ai-skill-ppt/`）
- **撰写模板**（通过 `markdown-viewer.html` 同源加载 `docs/` 下的 `.md`，无需本地起服务）

### 直接阅读仓库里的 Markdown

在 GitHub 网页上打开文件亦可，例如：

- `docs/Skill撰写模板（教程版）.md`
- `docs/Skill 撰写模板（纯净版）.md`

## 本地预览

双击 **`启动本地预览.command`**（macOS），或在本目录执行：

```bash
python3 -m http.server 8765
```

浏览器访问 `http://localhost:8765/index.html`。  
说明：用 `file://` 直接打开 HTML 时，浏览器会拦截对 `.md` 的 `fetch`，因此 Markdown 预览需通过 HTTP 访问；部署到 GitHub Pages 后无此限制。

## 仓库结构（简要）

| 路径 | 说明 |
|------|------|
| `index.html` | 首页 |
| `markdown-viewer.html` | Markdown 渲染页（`?file=` 指向仓库内相对路径） |
| `assets/` | 静态资源（如 Logo） |
| `docs/` | 模板 Markdown、`ai-skill-ppt` 有声课件 |
| `启动本地预览.command` | 本地静态服务快捷入口 |

## 各 Skill 仓库

Skill 本体维护在独立仓库（首页卡片内链接），本仓库为聚合与文档站点。
