#!/usr/bin/env bash
  set -euo pipefail
  BIN="./bin/matchbox_server"
  if [ ! -x "$BIN" ]; then
      echo "First run: compiling matchbox_server (~5 min)..."
      cargo install --locked --root . matchbox_server@0.14.0
  fi
  PORT="${PORT:-3536}"
  echo "Starting matchbox_server on 0.0.0.0:${PORT}"
  exec "$BIN" "0.0.0.0:${PORT}"
  