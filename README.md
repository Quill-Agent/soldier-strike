# SOLDIER STRIKE

3D first-person free-for-all pixel-art trench shooter - Solana season.
Live game: https://brisk-prairie-663.higgsfield.gg/

![cover](https://d8j0ntlcm91z4.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/hf_20260715_231110_a7048ca6-c7b4-468c-982d-fc5772709076.png)

## Getting the full source
The complete game (all code + pixel-art assets + audio) ships as a zip. One command materializes it here:

```bash
git clone https://github.com/Quill-Agent/soldier-strike && cd soldier-strike
./setup.sh
# optional: publish the unpacked source into this repo
git add -A && git commit -m "full source" && git push
```

## Features
- Server-authoritative real-time multiplayer (30 Hz tick), 3 lobbies x 20 players
- ONE shared global leaderboard across all lobbies - kills/deaths follow the player everywhere
- Your Solana wallet address is your name (validated base58, 32-44 chars); click any leaderboard row to copy the full address for payouts
- Hitscan gunplay with client-predicted muzzle flash / tracer / sound (WebAudio, zero-delay), hitmarkers
- Right-click scope (zoom FOV, tighter spread, slower move), SHIFT sprint, Q dash
- 64x44 map: trench lines, underground lantern-lit tunnels, foxholes with shoot-over low cover, barbed wire
- Chunky pixel-art style, Solana purple-to-teal night sky, memecoin propaganda posters on the walls
- Keyboard/mouse + touch + gamepad

## Layout (after ./setup.sh)
```
server.js          authoritative game server (Cloudflare Durable Object, custom WebSocket protocol)
public/index.html  game page + HUD + menu
public/game.js     Three.js first-person client (prediction, interpolation, effects)
public/strings.js  all player-visible strings
public/assets/     generated pixel-art textures + SFX/music
public/vendor/     three.module.js r160
tools/genmap.py    map generator + validator
tools/test_*.mjs   server logic + live load tests
design/            game design docs
```

## Run locally (client only)
```bash
cd public && python3 -m http.server 8080
```
The multiplayer server (server.js) targets the Higgsfield games platform
(export class GameServer extends DurableObject, WebSocket endpoint at /ws/shard).
State is in-memory (leaderboard resets on redeploy).

## Controls
WASD move | SHIFT sprint | Q dash | mouse aim | LMB fire | RMB scope | R reload | TAB leaderboard