# WadFusion — simple IWAD merge utility

WadFusion merges your provided DOOM, DOOM II, and Final DOOM data into a single IPK3 file that can be played in [ZDoom](https://zdoom.org/index), with each game as its own entry in the episode list. This makes it very convenient to play all of classic DOOM's official releases without re-launching the game with different settings.

It's fine if you don't have all of the DOOM games, e.g. you have DOOM II but not Final DOOM—WadFusion will package up everything it can find.

If you just bought these games from [GOG](https://www.gog.com/en/game/doom_doom_ii), or [Steam](https://store.steampowered.com/app/2280/), etc., and you aren't familiar with ZDoom and DOOM modding, see the [**Absolute Beginner's Guide**](#absolute-beginners-guide) section below.

### Note: WadFusion requires UZDoom or LZDoom. It will not work with other engines.

## Usage

Simply copy all of your WADs into the `source_wads` subfolder, then run WadFusion. A log will appear showing progress and any errors that arise. A new file called `doom_fusion.ipk3` will be created, with all the game content in it. It should be selectable in ZDoom as "DOOM Fusion".

Also included is a file called `doom_fusion_widescreen_gfx.pk3`, which adds super-ultra-widescreen assets courtesy of the [Ultra-Widerpix854 project](https://www.doomworld.com/forum/topic/148537). DOOM Fusion will load it automatically if it's placed in the same directory as the IPK3. ZDoom's own widescreen assets are disabled in Fusion. (It's worth noting that the full Ultra-Widerpix854 project has some extra features not included with WadFusion, such as alternate versions for some graphics, extended sky textures, and support for other DOOM-based games.)

## Options

WadFusion can be launched with the following command line arguments:

- `-h`, `--help` — Show the help message and exit.
- `--version` —  Show program's version number and exit.
- `-v`, `--verbose` — Print out all the logged information.
- `-w PATH`, `--wads PATH` — Search the specified directory path for WADs. Can be used multiple times.
- `-p`, `--patch` — Patch an existing IPK3 without extracting WADs.
- `-d`, `--deflate` — Use DEFLATE compression when generating the IPK3.
- `-e`, `--extract-only` — Skip copying pre-authored lumps and only extract WADs (for developers).

## Supported WADs

WadFusion is not a general-purpose tool for merging DOOM WADs; it is for merging *official content only*—it was created out of a desire for a "complete" version of retail DOOM and DOOM II. Please do not ask if WadFusion will support any specific WAD. This includes any content from the 5th generation console ports. If you want to add your own content to a custom IPK3, either modify WadFusion's code yourself, or simply edit the IPK3 that WadFusion generates. Please try consulting the [ZDoom Wiki](https://zdoom.org/wiki/Main_Page) first before asking for help. If you've created an addon for WadFusion, feel free to share it with the community on the [Discussions](https://github.com/Owlet7/wadfusion/discussions/categories/show-and-tell) section.

Here is the official list of WADs that WadFusion will recognize:
- DOOM (original registered version of `doom.wad`, containing only episodes 1-3)
- The Ultimate DOOM (retail version of `doom.wad` or `doomu.wad`, containing episodes 1-4)
- DOOM II (`doom2.wad`)
- Master Levels for DOOM II (the original 20 WAD files, or `masterlevels.wad` from the [KEX-based re-release](https://doomwiki.org/wiki/Doom_%2B_Doom_II))
- Master Levels Rejects ([see below](#master-levels-rejects) for a full list of supported WADs)
- Final DOOM (`tnt.wad` and `plutonia.wad`)
- No Rest for the Living (`nerve.wad`)
- SIGIL (`sigil.wad` and optionally its MP3 soundtrack version)
- SIGIL II (`sigil2.wad` and optionally its MP3 soundtrack version)
- Legacy of Rust (`id1.wad` and `iddm1.wad` from the [KEX-based re-release](https://doomwiki.org/wiki/Doom_%2B_Doom_II))
- Xbox secret levels (`sewers.wad` and `betray.wad` from the [original Xbox port of DOOM](https://doomwiki.org/wiki/Xbox))
- Tech Gone Bad and Phobos Mission Control (`e1m8b.wad` and `e1m4b.wad`, John Romero's map remakes)
- Extras (`extras.wad` from the [Unity](https://doomwiki.org/wiki/Doom_Classic_Unity_port) or [KEX-based](https://doomwiki.org/wiki/Doom_%2B_Doom_II) re-releases)

If IWADs from the Unity or KEX-based re-releases are also included (must be named `doomunity.wad`, `doom2unity.wad`, `tntunity.wad`, `plutoniaunity.wad` or `doomkex.wad`, `doom2kex.wad`, `tntkex.wad`, `plutoniakex.wad`), WadFusion will extract the official widescreen assets from them. These versions can also be used as the main IWADs for extraction, but do keep in mind that they are censored, and that WadFusion already comes with optional super-ultrawide assets.

If `extras.wad` from the re-releases is included, WadFusion will extract the official "secret revealed" sound, and some status bar icons that can be used by the custom alternate fullscreen HUD. If the version from the KEX-based re-release is used, WadFusion will also extract Andrew Hulshult's "IDKFA" covers of the DOOM and DOOM II soundtracks, which can be toggled from the WadFusion options menu.

None of the "official add-on" content from the Unity or KEX-based re-releases of DOOM and DOOM II is supported.

For SIGIL and SIGIL II, all the filenames for different releases of those WADs are also recognized; you shouldn't have to rename your original files. If the registered versions of SIGIL or SIGIL II are included, WadFusion will extract both MIDI and MP3 soundtracks from them, which can be toggled from the WadFusion options menu. The MP3 versions aren't supported on their own, the MIDI versions must be included alongside them.

[Tech Gone Bad](https://doomwiki.org/wiki/Tech_Gone_Bad) and [Phobos Mission Control](https://doomwiki.org/wiki/Phobos_Mission_Control) are levels that were made as a warm-up exercise for John Romero's cancelled game, Blackroom. If they're included, enabling them in the WadFusion options menu will replace E1M8 or E1M4 in the Knee-Deep in the Dead episode.

## Recommended WADs

WadFusion will work with most versions of the supported WADs, but in order to generate a "best" version of `doom_fusion.ipk3`, it is recommended to use the following versions ([Master Levels Rejects](#master-levels-rejects) listed separately):

| WAD                       | WAD file                | MD5 hash code                      | Where to get                                                                                                                     |
| :------------------------ | :---------------------- | :--------------------------------- | :------------------------------------------------------------------------------------------------------------------------------- |
| DOOM                      | `DOOM.WAD`              | `1cd63c5ddff1bf8ce844237f580e9cf3` | Mail order from id Software in 1993                                                                                              |
| The Ultimate DOOM         | `DOOM.WAD`              | `c4fe9fd920207691a9f493668e0a2083` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (DOS) (rename to `DOOMU.WAD`) |
| DOOM II                   | `DOOM2.WAD`             | `25e1459ca71d321525f84628f45ca8cd` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (DOS)                         |
| TNT: Evilution            | `TNT.WAD`               | `4e158d9953c79ccf97bd0663244cc6b6` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (DOS)                         |
| The Plutonia Experiment   | `PLUTONIA.WAD`          | `75c8cf89566741fa9d22447604053bd7` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (DOS)                         |
| Master Levels for DOOM II | `masterlevels.wad`      | `ab3ce78e085e50a61f6dff46aabbfaeb` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| No Rest for the Living    | `nerve.wad`             | `23422eb42833ac7b0dd59c0c7ae18a6f` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| SIGIL                     | `sigil.wad`             | `08ee05388c137db5f5d7996e89425b95` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| SIGIL II                  | `sigil2.wad`            | `953f65cf079d0ba9a25be2c407da7ec1` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| Legacy of Rust            | `id1.wad`               | `713c5a3c1734b1d55b2813a3dd0136d9` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| id Deathmatch Pack #1     | `iddm1.wad`             | `cb92010b8ec05f8924ac966a8ed95b74` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| DOOM + DOOM II Extras     | `extras.wad`            | `2e76d93d52ef64fb9db3cee2437c686b` | [GOG](https://www.gog.com/en/game/doom_doom_ii) / [Steam](https://store.steampowered.com/app/2280) (KEX)                         |
| SIGIL + Buckethead        | `SIGIL_V1_23_REG.wad`   | `25c5835ec5352c9587440b7403ff6e8f` | [The Romero Shop](https://romero.com/sigil)                                                                                      |
| SIGIL II + THORR          | `SIGIL_II_MP3_V1_0.WAD` | `732fb8f9c470e857189c206a9279af74` | [The Romero Shop](https://romero.com/sigil)                                                                                      |
| Tech Gone Bad             | `e1m8b.wad`             | `86e94729257b94f982dbe3e3a81e2679` | [/idgames archive](https://www.doomworld.com/idgames/levels/doom/Ports/d-f/e1m8b)                                                |
| Phobos Mission Control    | `e1m4b.wad`             | `ffce7f3a2e42ba779e211c4cf17fa591` | [/idgames archive](https://www.doomworld.com/idgames/levels/doom/Ports/d-f/e1m4b)                                                |
| Sewers                    | `SEWERS.WAD`            | `7b30cba8c9a79405a7240fd68eb013a5` | [ClassicDoom.com](https://classicdoom.com/xboxspec.htm)                                                                          |
| Betray                    | `BETRAY.WAD`            | `2bb99c282627b58ef3c753a9544255b9` | [ClassicDoom.com](https://classicdoom.com/xboxspec.htm)                                                                          |

## Master Levels Rejects

The WadFusion options menu has an option to switch the Master Levels between the official 21 map order as arranged by Xaser, and the expanded 43 map order that incorporates the rejected and related bonus maps, and arranges them into sub-episode campaigns.

To integrate the Master Levels Rejects, you must include The Ultimate DOOM, DOOM II, Master Levels for DOOM II (either the original 20 WAD files, or preferably `masterlevels.wad` from the KEX-based re-release), and *all* of the following WADs:

| Link to WAD                                                                              | WAD file                | MD5 hash code                      |
| :--------------------------------------------------------------------------------------- | :---------------------- | :--------------------------------- |
| [The C.P.U.](https://www.doomworld.com/idgames/levels/doom2/a-c/cpu)                     | `cpu.wad`               | `b346e39e3a3f60f9f6b09a3c68c00764` |
| [Device One](https://www.doomworld.com/idgames/levels/doom2/d-f/device_1)                | `device_1.wad`          | `7a377bf109886caaea83c5786ae1f711` |
| [The D.M.Z.](https://www.doomworld.com/idgames/levels/doom2/d-f/dmz)                     | `dmz.wad`               | `ebc27a4459c932067a80b0ec01dcf122` |
| [The Fury](https://www.doomworld.com/idgames/levels/doom2/a-c/cdk_fury)                  | `cdk_fury.wad`          | `149a79c153d7031f685b83d4d7379385` |
| [The Enemy Inside](https://www.doomworld.com/idgames/levels/doom2/d-f/e_inside)          | `e_inside.wad`          | `185fea1f3ce7224c83620d29f6b36fd3` |
| [The Hive](https://www.doomworld.com/idgames/levels/doom2/g-i/hive)                      | `hive.wad`              | `4cb405b9ae5bb04fd80dfc81ecb9960a` |
| [Doom2 Map14 Homage](https://www.doomworld.com/idgames/levels/doom2/s-u/twm01)           | `TWM01.WAD`             | `f9134bb5449bc17a2c37cb207281cd95` |
| [Mines of Titan](https://www.doomworld.com/idgames/levels/doom2/m-o/mines2)              | `MINES.WAD`             | `b4e975d9a824759a45302ad3d3894dcc` |
| [The Titan Anomaly](https://www.doomworld.com/idgames/levels/doom2/a-c/anomaly)          | `anomaly.wad`           | `00a605251b95e4a4853d09cfbc151399` |
| [The Farside of Titan](https://www.doomworld.com/idgames/levels/doom2/d-f/farside)       | `FARSIDE.WAD`           | `857933d2018470d49a15381f34c124b6` |
| [Trouble on Titan](https://www.doomworld.com/idgames/levels/doom2/s-u/trouble)           | `TROUBLE.WAD`           | `ee7a0adf490b495de1a4ad8388dbe3c6` |
| [Dante's Gate](https://www.doomworld.com/idgames/levels/doom2/d-f/dante25)               | `DANTE25.WAD`           | `bb8269f8ec1fe408ef946e48b2b185d1` |
| [Crossing Acheron](https://www.doomworld.com/idgames/levels/doom2/a-c/achron22)          | `ACHRON22.WAD`          | `58fdafefd08cb2e1841aa49052ff78bd` |
| [Caball](https://doomshack.org/uploads/caball.zip)                                       | `CABALL.WAD`            | `a4a7e7b33233014601e1ba74c5dae1fe` |
| [Ultimate Doom The Way id Did](https://www.doomworld.com/idgames/levels/doom/s-u/udtwid) | `UDTWiD.wad`            | `c04696a6abda5ed345b040065e2934c6` |

**Note: [Works of the Masters](https://jp.itch.io/deluxe-master-levels) is not supported by WadFusion! Do not use the WADs included with it!**

## Full Run Mode

WadFusion features optional "Full Run" modes. When enabled, finishing an episode will immediately start the next episode. If an episode isn't available, it will be skipped over.

It can be enabled from the WadFusion options menu, and is available in three configurations:

| Default order           | Release Order           | Chronological order     |
| ----------------------- | ----------------------- | ----------------------- |
| Knee-Deep in the Dead   | Knee-Deep in the Dead   | Knee-Deep in the Dead   |
| The Shores of Hell      | The Shores of Hell      | The Shores of Hell      |
| Inferno                 | Inferno                 | Inferno                 |
| Thy Flesh Consumed      | Hell On Earth           | Thy Flesh Consumed      |
| SIGIL                   | Thy Flesh Consumed      | SIGIL                   |
| SIGIL II                | Master Levels           | SIGIL II                |
| Hell On Earth           | TNT: Evilution          | Hell On Earth           |
| Master Levels           | The Plutonia Experiment | No Rest for the Living  |
| No Rest for the Living  | No Rest for the Living  | Master Levels           |
| The Vulcan Abyss        | SIGIL                   | TNT: Evilution          |
| Counterfeit Eden        | SIGIL II                | The Plutonia Experiment |
| TNT: Evilution          | The Vulcan Abyss        | The Vulcan Abyss        |
| The Plutonia Experiment | Counterfeit Eden        | Counterfeit Eden        |

Whether or not the Master Levels are included in a Full Run can also be toggled from the WadFusion options menu.

## Absolute Beginner's Guide

1. Download WadFusion for [Windows](https://github.com/Owlet7/wadfusion/releases/latest/download/wadfusion_win.zip) or [macOS and GNU/Linux](https://github.com/Owlet7/wadfusion/releases/latest/download/wadfusion_py.zip), and extract it to a folder.
2. Find the folder(s) where GOG / Steam installed your game(s).
   - For Steam on Windows, this will be something like\
   `C:\Program Files (x86)\Steam\steamapps\common\Ultimate Doom\base`
3. Copy any files you find with a `.WAD` extension to the `source_wads` subfolder where you extracted WadFusion.
4. On Windows, launch `wadfusion.exe`. On macOS or GNU/Linux, run the `wadfusion.py` Python 3 script.
5. A terminal window will show which episodes can be extracted. Press Y and then Enter to proceed.
6. The terminal window will show progress as it generates the IPK3. When it finishes, press Enter to close the window. You should now have a file in the WadFusion folder called `doom_fusion.ipk3`.
7. Download [UZDoom](https://zdoom.org/downloads) and extract it to a folder.
8. Copy the `doom_fusion.ipk3` and `doom_fusion_widescreen_gfx.pk3` files to UZDoom's folder.
9. Launch UZDoom and play!

## Acknowledgements

[WadSmoosh](https://jp.itch.io/wadsmoosh) was originally developed by JP LeBreton. WadFusion is based on its [source code](https://heptapod.host/jp-lebreton/wadsmoosh).

WadFusion uses the [Omgifol Python library](https://github.com/devinacker/omgifol) by Fredrik Johansson and Devin Acker.
