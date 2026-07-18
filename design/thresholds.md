# thresholds.md - fixed before implementation

- FPS target: 60 fps client render; smoke red line: avg < 45 fps on worst-case scene.
- draw_call_budget: 250 draw calls worst-case (3D client batches statics: map walls = 1 InstancedMesh, ground = 1 composited plane, crates/barrels/wire/posters/roofs/low-cover = instanced, tracers pooled). Analytic worst case ~131.
- Mud tile seam: numeric ratio 2.83 (metric inflated by flat-color pixel art regions); 2x2 visual inspection = seams invisible = PASS.
- worst_case_scene: 20 players clustered at center, all firing, full HUD + kill feed.
- Server tick: 30 Hz fixed; tick compute budget <= 8 ms for 3 lobbies x 20 players.
- Snapshot size: ~2.5 KB per lobby per tick (JSON), measured live with 20 players.
- Input-to-visible reaction latency: instant client-side (predicted shot effects, WebAudio SFX).
- Interpolation delay: 130 ms buffered; reconnect: auto within 2 s, restores identity + stats.
- Game entry: <= 3 steps from load to spawn.
- Regeneration budget per asset: 2 attempts, then best-of + code compensation.