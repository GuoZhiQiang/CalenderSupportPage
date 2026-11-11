# 部署到 cookzq.top（阿里云）

本仓库同时托管在 GitHub Pages（guozhiqiang.github.io/CalenderSupportPage）和阿里云服务器 `cookzq.top`（47.117.131.46，Alibaba Cloud Linux 3）。

| 地址 | 来源 |
|---|---|
| http://cookzq.top/ | 本仓库 `index.html` / `privacy.html`（CalendarNotes） |
| http://cookzq.top/timetravel/ | `GuoZhiQiang.github.io` 仓库的 `timetravel/`（穿越必备手册） |

## 更新网站

1. 修改页面，推送到 GitHub（本仓库或 `GuoZhiQiang.github.io`）
2. 等 1～2 分钟，让 GitHub Pages 更新
3. 阿里云控制台 → ECS 实例 → 远程连接 → Workbench（免密连接，用户 root），执行：

```bash
curl -fsSL https://guozhiqiang.github.io/CalenderSupportPage/deploy.sh | bash
```

看到 `Deploy OK` 和两个 `HTTP/1.1 200 OK` 就完成了。用手机流量（不要用公司网络，Zscaler 会拦截）打开 http://cookzq.top 检查。

## 备案信息

- 主体备案号：沪ICP备2026059862号（显示在所有页面底部，链接到 https://beian.miit.gov.cn/ ）
- 穿越必备手册 App：沪ICP备2026059862号-1A
- CalendarNotes App：沪ICP备2026059862号-2A
- `cookzq.top` 是两个 App 的后台服务域名，必须一直解析到阿里云内地服务器，否则会被取消接入
- 公安备案号下来后，也要加到页面底部

## 服务器备忘

- 安全组 `sg-uf6fddkwfwl99vo7y9bg` 已放行 22 / 80 / 443
- 网站目录：`/usr/share/nginx/html`
- 每年续费 ECS 和域名
