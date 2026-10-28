---
name: pxxl-one-line-node
description: >-
  Use when the user wants a one-sentence / Agent 一句话 zero-card Free VLESS+WS+TLS
  node on Pxxl App (pxxl.app / app.pxxl.app) via GitHub-repo Node deploy (not
  Docker/Drop), E2E generate_204 verification, and a scrubbed vless:// delivery.
  Also when they say Pxxl Free, pxxlspace.cv, or ask to publish/replicate the
  pxxl-xray-ws-tls-skill pack.
---
# Pxxl One-Line Node (Free · VLESS + WS + TLS)

Deploy a **zero-card** spare **VLESS + WebSocket + TLS** node on [Pxxl](https://pxxl.app) / [app.pxxl.app](https://app.pxxl.app) from one sentence. Free path = **GitHub repo → Node**. Docker/Drop/Dockerfile on Free = **paid-locked**.

Upstream pack: https://github.com/free-dam-man/pxxl-xray-ws-tls-skill (MIT). Local copy of `deploy/` may also live under `/workspace/oss/pxxl-xray-ws-tls-skill/deploy/` on this box.

## When to use
- User:「Agent 一句话 Pxxl 出节点」「Pxxl Free 免卡」「pxxlspace.cv」
- Need Free PaaS with edge TLS + Node wrapper (not true residential exit)

## Do
1. Prep repo from `deploy/package.json` + `setup.js` + `server.js` (Node detect; `build` downloads Xray + unpacks `geoip.dat`/`geosite.dat`; `start` runs VLESS/WS on `$PORT`).
2. Push GitHub (public or private). Prefer an **aged** GH identity.
3. Browser: login `app.pxxl.app` via **GitHub OAuth** → install **Pxxl GitHub App** scoped to that repo (sudo OTP may need user).
4. Create project from repo. Confirm **Node** (never Docker on Free).
5. Set env: fresh `UUID`, `WSPATH` (leading `/`). `PORT` = platform.
6. Wait **Deployed**. Note `*.pxxlspace.cv` host.
7. Build URL:
   `vless://<UUID>@<HOST>:443?encryption=none&security=tls&type=ws&host=<HOST>&path=<urlencoded WSPATH>&sni=<HOST>#Pxxl`
8. E2E: client → SOCKS → `https://www.gstatic.com/generate_204` = **204**; check exit (expect **AWS datacenter**, e.g. Paris `eu-west-3` class — **not** 真家宽).
9. Deliver link + honest limits (spare, pool IP may change). Never commit live secrets.

## Don't
- Don't ship Dockerfile as Free entrypoint.
- Don't commit `pxxl.env`, live UUID/path/host, GH tokens, or decodeable live `vless://`.
- Don't treat Deployed UI as success without E2E.
- Don't call AWS Free-pool exit 真家宽.
- Don't promise quota/uptime; don't use as China daily driver (prefer Zoho/Light Cloud XHTTP+TLS).

## Launch 口令
```text
照 pxxl-xray-ws-tls-skill deploy/ 推 GH → app.pxxl.app GH OAuth + GH App（仅本仓）→ Free 建 Node 项目（禁 Docker）→ UUID+WSPATH → Deployed → VLESS+WS+TLS *.pxxlspace.cv:443 → SOCKS generate_204=204 + 出口 IP → 交付；scrub 密钥；当备用。
```
