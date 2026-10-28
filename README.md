# Pxxl App · VLESS + WS + TLS 一键复刻（Free / 免卡）

> Pxxl（[pxxl.app](https://pxxl.app) / [app.pxxl.app](https://app.pxxl.app)）Free：平台边缘终止 TLS，容器内跑 **Node 包装的 VLESS + WebSocket（明文）**。  
> 客户端侧：`security=tls` + `type=ws` + `*.pxxlspace.cv:443`。

**English:** Free plan is **GitHub-repo deploy only** (no card). Drop / Docker / Dockerfile paths are **paid-locked** — language must be detected as **Node** (`package.json`). Copy `deploy/`, push a repo, connect the Pxxl GitHub App, set `UUID` / `WSPATH`, wait **Deployed**. Verified **2026-10-28 Asia/Shanghai**: E2E `generate_204=204`, exit **Paris AWS datacenter** (`eu-west-3`). Live UUID / path / host are **not** published here — use placeholders.

Sibling skills:

- [hubfly-xray-ws-tls-skill](https://github.com/free-dam-man/hubfly-xray-ws-tls-skill) — Hubfly · WS + TLS
- [wispbyte-xray-ws-skill](https://github.com/free-dam-man/wispbyte-xray-ws-skill) — Pterodactyl 明文 WS 备用
- [zoho-catalyst-appsail-xhttp-skill](https://github.com/free-dam-man/zoho-catalyst-appsail-xhttp-skill) — Zoho AppSail · XHTTP + TLS
- [light-cloud-xhttp-skill](https://github.com/free-dam-man/light-cloud-xhttp-skill) — Light Cloud · XHTTP
- [homeline-residential-exit-skill](https://github.com/free-dam-man/homeline-residential-exit-skill) — 五国真家宽

---

## 为什么必须是 Node / Why Node (not Docker)

| Free trait | Consequence |
|---|---|
| GitHub-only deploy on Free | Push `deploy/` as a public or private repo |
| Drop / Docker / Dockerfile = paid | **Do not** lead with a Dockerfile on Free |
| Needs language = Node | Ship `package.json` + `setup.js` + `server.js` |
| Edge TLS on `*.pxxlspace.cv` | Client `security=tls` on `:443`; inside = plain WS on `$PORT` |

Xray 新版本已标 WS 废弃；本技能保留 WS 是因为 Free 边缘是 HTTP→容器。中国日常入口优先 Zoho / Light Cloud 的 **XHTTP+TLS** 兄弟技能；Pxxl 当 **备用**。

---

## 架构 / Architecture

```text
Shadowrocket / v2rayN / sing-box / Xray
   │  VLESS + WS + TLS   sni=host=<*.pxxlspace.cv>   :443
   ▼
Pxxl edge (TLS)
   │  plain HTTP/WS → container :$PORT
   ▼
node (package.json)
   ├─ setup.js  → download Xray-linux-64.zip, unpack web-worker + geoip.dat + geosite.dat
   └─ server.js → VLESS/WS listen 0.0.0.0:$PORT  path=$WSPATH
        └─ exit = Pxxl Free pool AWS datacenter IP (not 真家宽; may change on recycle)
```

---

## 快速复刻 / Reproduce

1. **Prep repo** from this skill’s `deploy/` (`package.json` + `setup.js` + `server.js`). Push to GitHub (public OK; private also fine if the Pxxl GitHub App can read it).
2. **Register / login** [app.pxxl.app](https://app.pxxl.app) with **GitHub OAuth**. An **aged** GitHub identity helps; brand-new accounts may get friction.
3. **Install the Pxxl GitHub App** scoped to that repo (sudo OTP may be required for org / protected accounts — have the user ready).
4. **Create project from the repo**. Confirm language = Node / start = `npm start` (or `node server.js`). Do **not** pick Docker on Free.
5. Set env (**never commit live values**):

| Env | Example | Notes |
|---|---|---|
| `UUID` | fresh UUIDv4 | **required** (`APP_KEY` alias accepted) |
| `WSPATH` | `/your-rail` | must start with `/` (`API_ROUTE` alias) |
| `PORT` | platform-injected | wrapper defaults `8080` if missing |

6. Wait until status is **Deployed**. Build may download ~Xray zip on first boot; ensure `geoip.dat` / `geosite.dat` unpack succeeded (`setup.js`).
7. Note the HTTPS host (`<name>.pxxlspace.cv`).
8. **Client URL**（占位符）:

```text
vless://<UUID>@<HOST>:443?encryption=none&security=tls&type=ws&host=<HOST>&path=<urlencoded WSPATH>&sni=<HOST>#Pxxl
```

Helper: `scripts/make_vless_url.sh`

9. **Verify**：真实客户端 → SOCKS → `https://www.gstatic.com/generate_204` 期望 **204**，再查出口城市/ASN（预期 AWS 机房，不是真家宽）。面板 Deployed alone **不算**验收。

---

## 仓库内容 / Layout

```text
deploy/package.json   # Node detect + start/build scripts
deploy/setup.js       # download Xray zip; unpack web-worker + geo*.dat
deploy/server.js      # UUID/WSPATH/PORT → VLESS/WS → exec web-worker
scripts/make_vless_url.sh
docs/TECH.md          # Free vs paid, GH App notes
docs/TECH_NOTE.md     # scrubbed operator note
SKILL.md              # agent brief
LICENSE               # MIT
```

Defaults use **placeholders** (`<UUID>` `<WSPATH>` `<HOST>`). Never publish live UUID、path、host、Pxxl/GitHub 账密、或可解码的真订阅。

---

## 诚实限制 / Honest limits

- **出口 = AWS 机房池** — 已验证巴黎 datacenter；换实例会变。不是真家宽。
- **Free = GitHub only** — 别在 Free 上硬上 Dockerfile / Drop。
- **配额 / 休眠未写死保质期** — 当备用，别当主力。
- **GitHub App + 账号龄** — 新号 / 无 App 授权会卡；sudo OTP 可能要用户出面。
- **WS 在新 Xray 已标废弃** — 日常中国入口仍优先 Zoho / Light Cloud XHTTP+TLS。
- **条款** — 自用复刻；勿公开滥发开放中继。

---

## One-liner 口令 / Agent prompt

```text
照 https://github.com/free-dam-man/pxxl-xray-ws-tls-skill ：把 deploy/ 推到 GitHub，app.pxxl.app GitHub 登录并装 GH App（仅本仓库），Free 建项目（必须 Node，禁止 Docker），设 UUID+WSPATH，等 Deployed，客户端 VLESS+WS+TLS 走 *.pxxlspace.cv:443；E2E generate_204=204 且出口为 AWS 机房后再交付；勿提交真 UUID/path/账密；当备用勿当真家宽。
```

---

## License

MIT — copy, fork, teach. Freedom / no-walls.
