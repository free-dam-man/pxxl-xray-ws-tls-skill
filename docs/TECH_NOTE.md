# Operator note (scrubbed)

- Never commit `pxxl.env`, live UUID, live `WSPATH`, live `*.pxxlspace.cv` host bound to a real node, or decodeable subscription blobs.
- Rotate UUID + path per public teach / per fork.
- Sibling daily drivers (China entry): Zoho AppSail / Light Cloud **XHTTP+TLS**. This Pxxl skill is a **zero-card spare**.
- If build fails on missing `geoip.dat` / `geosite.dat`, ensure `setup.js` ran (`npm run build` or first `server.js` boot) and that unzip left both `.dat` files next to `web-worker`.
- GitHub App scopes: prefer **only** the deploy repo; revoke when done teaching.
