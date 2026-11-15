# F1 2013 iOS

An unofficial, work-in-progress native iOS port of the Xbox 360 version of
**F1 2013**, made by static recompilation with the
[ReXGlue SDK](https://github.com/rexglue/rexglue-sdk).

**This repository contains no game code or game data.** It holds the iOS
layer (launcher, runtime patches, build scripts) and documentation only. To
use it you need your own legally obtained Xbox 360 copy of F1 2013.

## How the pieces fit

| Where | What | Visibility |
| --- | --- | --- |
| This repo | iOS launcher, patches, build scripts, docs | public |
| Your own private repo | Code generated from *your* `default.xex`, the iOS build workflow | private |
| Your PC | `default.xex` and game files; runs the code generator | never uploaded |

The iOS app is built in the private repo, because the finished app contains
the generated game code and a public repository's build downloads are
visible to everyone.

## Status

| Step | State |
| --- | --- |
| 1. Generate code from `default.xex` on a PC | not started — see [docs/PC_SETUP.md](docs/PC_SETUP.md) |
| 2. Boot on PC (Windows/Linux) | not started |
| 3. iOS build (Vulkan through MoltenVK) | not started |
| 4. Playable on iPhone | not started |

## Rules for contributions

- Never commit `default.xex`, `.xex`/`.iso`/`.god` files, game archives,
  generated recompiled code, or anything extracted from the game.
  `scripts/check_no_game_files.sh` enforces this.
- Keep everything here original or under an open-source licence.

## Credits

- [ReXGlue SDK](https://github.com/rexglue/rexglue-sdk), built on the work of
  [Xenia](https://github.com/xenia-project/xenia) and
  [XenonRecomp](https://github.com/hedge-dev/XenonRecomp).
- The repository layout follows the approach of
  [WWE SvR 2011 iOS](https://github.com/Ke619/WWE-SvR11-IOS): public iOS
  layer, private generated code.

F1 2013 is a trademark of its respective owners. This project is not
affiliated with or endorsed by Codemasters, Formula One, Microsoft or Apple.
