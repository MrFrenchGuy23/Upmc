# Upmc

A performance-focused Purpur (Paper) fork for Minecraft 26.2.

## Performance tuning

### 1. Start scripts (Aikar's Flags)

`start.sh` / `start.bat` ship with tuned JVM flags (G1GC, Aikar's recommended GC profile).
Place the runnable Upmc paperclip jar next to the script and run it.

### 2. Bundled reference configs (`config/`)

Performance-tuned example configs validated against this fork's defaults:

| File | Where it goes | What it tunes |
| --- | --- | --- |
| `config/paper-global.yml` | server `config/` folder | chunk loading rates, chunk-system threads, autosave spread |
| `config/paper-world-defaults.yml` | server `config/` folder | explosion optimization, hopper occlusion, block/fluid tick caps |
| `config/spigot.yml` | world folder | hopper check rate, merge radius, entity activation range |
| `config/purpur.yml` | server root | tps-catchup, join burst limiting, log-ips |

Merge them with any existing configs — every key is a documented, safe tuning knob.

### 3. Fork code defaults

- `ticks-per.hopper-check` now defaults to **8** (was vanilla 1), Spigot's own recommended
  value. Hoppers check for work far less often, saving significant CPU on hopper-heavy
  survival servers. Revert to `1` in `spigot.yml` for vanilla hopper responsiveness.
- `optimize-explosions` (Paper) is enabled by default in the reference config.
- `hopper.ignore-occluding-blocks` enabled by default in the reference config.
