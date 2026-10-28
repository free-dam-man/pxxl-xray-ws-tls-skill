# pxxl-xray-ws-tls-skill

## When to use
**Agent 一句话 / one-sentence:** deploy a **zero-card Free** **VLESS + WS + TLS** spare node on **Pxxl App** ([pxxl.app](https://pxxl.app) / [app.pxxl.app](https://app.pxxl.app)) via **GitHub-repo Node** deploy (not Docker).

## Do
1. Copy `deploy/package.json` + `deploy/setup.js` + `deploy/server.js` into a GitHub repo; push.
2. Login [app.pxxl.app](https://app.pxxl.app) with **GitHub OAuth**; install **Pxxl GitHub App** scoped to that repo (aged GH identity helps; sudo OTP may be needed).
3. Create project **from the repo**. Language must be **Node**. On Free: **no** Dockerfile / Drop / Docker path.
4. Env: fresh `UUID`, `WSPATH` (leading `/`). Rely on platform `PORT`.
5. Wait **Deployed**. Build VLESS URL: `security=tls&type=ws&sni=<HOST>&host=<HOST>&path=<WSPATH>` on `:443` (`*.pxxlspace.cv`).
6. E2E: real client → SOCKS → `generate_204=204` + exit IP/ASN (expect **AWS datacenter**, not 真家宽).
7. Scrub secrets before any public commit. Treat as **spare**.

## Don't
- Don't use Dockerfile / Drop on Free — paid-locked.
- Don't commit live UUID, WSPATH, host, `pxxl.env`, GH tokens, or decodeable live `vless://`.
- Don't treat dashboard Deployed as success without E2E.
- Don't call AWS Paris / Free-pool exit "真家宽".
- Don't promise uptime / quota — Free policy is soft; spare only.
- Don't use as China daily driver — prefer Zoho / Light Cloud XHTTP+TLS siblings.

## Workflow (口令)
```text
prep deploy/ → push GH → app.pxxl.app GH OAuth → install GH App (repo-scoped) → create Node project → set UUID+WSPATH → Deployed → vless TLS+WS → SOCKS generate_204=204 + exit IP → deliver; scrub secrets
```
