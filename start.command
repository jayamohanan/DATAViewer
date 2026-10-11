#!/bin/bash
# Double-click in Finder to serve this folder locally and open the viewer.
cd "$(dirname "$0")" || exit 1

PORT=8000
while lsof -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; do PORT=$((PORT + 1)); done

echo "Serving DATAViewer at http://localhost:$PORT"
echo "Close this window (or press Ctrl+C) to stop."

(sleep 1; open "http://localhost:$PORT") &
python3 -m http.server "$PORT" --bind 127.0.0.1
