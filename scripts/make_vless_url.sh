#!/usr/bin/env bash
# Usage:
#   UUID=... HOST=your-app.pxxlspace.cv WSPATH=/your-path NAME=Pxxl ./scripts/make_vless_url.sh
set -euo pipefail
UUID="${UUID:?set UUID}"
HOST="${HOST:?set HOST (Pxxl *.pxxlspace.cv subdomain)}"
PORT="${PORT:-443}"
WSPATH="${WSPATH:-/api/v1/sync}"
NAME="${NAME:-Pxxl}"
ENC=$(WSPATH="$WSPATH" python3 -c "import urllib.parse,os; print(urllib.parse.quote(os.environ['WSPATH'], safe=''))")
echo "vless://${UUID}@${HOST}:${PORT}?encryption=none&security=tls&type=ws&host=${HOST}&path=${ENC}&sni=${HOST}#${NAME}"
