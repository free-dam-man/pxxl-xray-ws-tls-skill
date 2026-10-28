# Scrubbed platform notes (Pxxl App)

Date reference: 2026-10-28 (Asia/Shanghai). Live secrets intentionally omitted.

## Free vs paid (verified)
- **Free**: deploy from a **GitHub repository** only. No card required for this path.
- **Paid-locked on Free**: Drop / Docker / Dockerfile-based deploys. Do **not** ship a Dockerfile as the Free entrypoint — language must be detected as **Node** (`package.json` + `npm start` / `node server.js`).
- Host / subdomain style: `*.pxxlspace.cv` behind platform edge TLS on `:443`.
- Exit IP is an **AWS datacenter** pool address (verified Paris / `eu-west-3` once). Not 真家宽. Instance recycle may change the exit IP.

## Why Node wrapper (not Docker)
1. Free plan rejects pure Docker on this path.
2. `package.json` makes the project Node; `build` runs `setup.js` (download pinned Xray zip + unpack `geoip.dat` / `geosite.dat`); `start` runs `server.js` (VLESS/WS on `$PORT`).
3. Binary is renamed `web-worker` so logs look less like a bare proxy banner.

## GitHub App + identity
- Login: [app.pxxl.app](https://app.pxxl.app) via **GitHub OAuth**.
- Install the **Pxxl GitHub App** scoped to the deploy repo (and only that repo if possible).
- Fresh / low-trust GitHub accounts may hit friction; an **aged** identity helps.
- Org / sudo-protected repos may need a **sudo OTP** when installing the App or changing env — have the user ready.

## Env
| Env | Required | Notes |
|---|---|---|
| `UUID` | yes | UUIDv4; aliases `APP_KEY` accepted by wrapper |
| `WSPATH` | recommended | must start with `/`; aliases `API_ROUTE` |
| `PORT` | platform | Pxxl injects; wrapper defaults `8080` if missing |

## Acceptance bar
- Dashboard **Deployed** alone ≠ done.
- Real client → local SOCKS → `https://www.gstatic.com/generate_204` expect **HTTP 204**, then check exit city/ASN (expect AWS datacenter).

## Not validated here
- Long-term Free quota / idle sleep policy (treat as spare).
- China mobile 5G long-term stability of WS+TLS on this edge.
- Non-GitHub Free deploy paths (assume locked).
