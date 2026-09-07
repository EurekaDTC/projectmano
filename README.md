# Project Mano

*A short RPG retelling the Amar Chitra Katha story of Manonmani — a South Indian princess who has to decide her fate.*

## About

Built for **Smart India Hackathon** problem statement **SIH26208** — *"Student Innovation: conceptualize and develop unique toys and games based on our civilization, history, and culture"* (Toys/Games theme, Software category) — by team **Eurika**.

You play as Manonmani, the only daughter of Jeevakan, the weak Pandya king of Madurai, guided by the wisdom of sage Sundara. As political scheming closes in around the court, you walk through the palace and the forest beyond it, talking to the people around her, and decide whether she stays inside the walls of the castle or claims her own freedom.

## Gameplay so far

- Top-down 4-directional movement with matching idle/walk animations
- A dialogue system with a typewriter text effect, triggered by walking up to NPCs
- A comic-panel cutscene system, used for the story intro and key beats (e.g. the minister and his son plotting in the courtroom)
- Fade-to-black scene transitions between areas (palace → forest)
- Roaming animal NPCs (a horse) that wander and idle on their own
- Early scenes built out: the palace/world scene and a forest scene, with the king, queen, minister's son, and player character in place

This is a hackathon build in active development — story, art, and levels are still being filled in.

## Built with

- [Godot 4.7](https://godotengine.org/) (GL Compatibility renderer, for broad device support)
- GDScript

## Project structure

```
projectmano/
├── art/                 # sprites, tilesets, cutscene panels, particles
├── scenes/
│   ├── characters/      # player, king, queen, minister's son (cm)
│   ├── animals/         # horse
│   ├── levels/          # world, forest
│   └── mechs/           # dialogue box, cutscene player, NPC, transitions
├── scripts/              # GDScript: movement, dialogue, cutscenes, NPCs, transitions
├── icon.svg
└── project.godot
```

## Running it

1. Install [Godot 4.7 or newer](https://godotengine.org/download).
2. Clone the repo:
   ```bash
   git clone https://github.com/EurekaDTC/projectmano.git
   ```
3. Open Godot, choose **Import**, and select the `project.godot` file.
4. Press **F5** to run.

## Controls

| Input | Action |
|---|---|
| Arrow keys | Move |
| Walk into an NPC | Start dialogue |
| Next button | Advance / skip typing on the current dialogue line |

## Team Eurika

- **Ansh** — programming
- **Kinjal** — story & writing
- **Puneet** — story & writing

## Status & roadmap

- [x] Core movement and animation
- [x] Dialogue system
- [x] Cutscene system
- [x] First NPCs and an area transition
- [ ] Full story implemented in-game
- [ ] Remaining levels/areas
- [ ] Sound & music
- [ ] UI polish pass

## License

No license has been added yet — worth picking one (MIT is a common default for a project like this) before sharing it more widely. Some third-party sprite packs under `art/` may carry their own licenses, so check those before reuse.
