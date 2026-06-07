# matchbox-server

  A [matchbox_server](https://github.com/johanhelsing/matchbox) WebRTC signaling server deployed on Replit.

  ## What it does

  Runs `matchbox_server v0.14.0` as a Reserved VM on Replit, providing a WebSocket signaling endpoint for WebRTC peer-to-peer connections (e.g. for multiplayer games using the Matchbox library).

  ## Live deployment

  ```
  wss://basic-boilerplate.replit.app
  ```

  ## Files

  - `main.sh` — workspace entrypoint. Compiles the binary on first run (cached in `./bin/`), then launches it.
  - `.replit` — Replit config. Build phase compiles the binary; run phase launches it instantly so the health-check passes.
  - `replit.nix` — Nix packages: Rust toolchain + OpenSSL.

  ## Verify it's working

  Open browser devtools and run:

  ```js
  const ws = new WebSocket("wss://basic-boilerplate.replit.app/test_room");
  ws.onopen  = () => console.log("MATCHBOX OK: socket open");
  ws.onclose = e => console.log("closed", e.code, e.reason);
  ws.onerror = () => console.log("MATCHBOX ERROR: could not connect");
  ```

  A healthy server logs `MATCHBOX OK: socket open`.
  