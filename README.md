# SOLDIER STRIKE

3D first-person free-for-all pixel-art trench shooter — Solana season.
Live game: https://brisk-prairie-663.higgsfield.gg/

![cover](https://d8j0ntlcm91z4.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/hf_20260715_231110_a7048ca6-c7b4-468c-982d-fc5772709076.png)

## Features
- Server-authoritative real-time multiplayer (30 Hz tick), 3 lobbies x 20 players
- ONE shared global leaderboard across all lobbies — kills/deaths follow the player everywhere
- Your **Solana wallet address is your name** (validated base58, 32-44 chars); click any leaderboard row to copy the full address for payouts
- Hitscan gunplay with client-predicted muzzle flash / tracer / sound (WebAudio, zero-delay), hitmarkers
- Right-click scope (zoom FOV, tighter spread, slower move), SHIFT sprint (rifle lowered, exaggerated bob), Q dash
- 64x44 map: trench lines, underground lantern-lit tunnels, foxholes with shoot-over low cover, barbed wire
- Chunky pixel-art style, Solana purple-to-teal night sky, memecoin propaganda posters on the walls
- Keyboard/mouse + touch + gamepad

## Layout
```
server.js          authoritative game server (Cloudflare Durable Object, custom WebSocket protocol)
public/index.html  game page + HUD + menu
public/game.js     Three.js first-person client (prediction, interpolation, effects)
public/strings.js  all player-visible strings
public/assets/     generated pixel-art textures + SFX/music  (from assets zip, see Setup)
public/vendor/     three.module.js r160                      (from assets zip, see Setup)
tools/genmap.py    map generator + validator (connectivity, reachability)
design/            game design docs (plan, thresholds, asset manifest)
```

## Setup (binary assets)
GitHub's contents API only carries text, so textures/audio/three.js ship as a zip:

```bash
./setup.sh
# or manually:
# curl -L -o assets.zip "https://d2ol7oe51mr4n9.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/864d4e24-0fb9-4b66-83d7-b24fc2bc9ad4.zip"
# unzip assets.zip -d public/
```

## Run locally (client only)
```bash
cd public && python3 -m http.server 8080
```
The multiplayer server (`server.js`) targets the Higgsfield games platform
(`export class GameServer extends DurableObject`, WebSocket endpoint at `/ws/<shard>`).
Deploys are done via the platform; state is in-memory (leaderboard resets on redeploy).

## Controls
WASD move · SHIFT sprint · Q dash · mouse aim · LMB fire · RMB scope · R reload · TAB leaderboard
