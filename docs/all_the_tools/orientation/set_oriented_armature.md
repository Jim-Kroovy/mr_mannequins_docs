---
title: Set Oriented Armature
parent: Orientation
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/orientation/set_oriented_armature/
---

# Set Oriented Armature

**Set Oriented Armature** (`mmt.oriented`) makes a Blender compatible armature by orienting bones using shortest rolls by matching names, adding any new bones from the original. It's at `Pose > Apply` as **Create Oriented Armature** or **Update Oriented Armature**, depending on whether the armature already has an oriented pair. The same label is at `Properties > Armature > Orientation`, and it's also in F3 Operator Search. It needs an active armature. There's no `poll()` check, and it reads the armature hierarchy of the active object.

{% include media/youtube.html title="Creating an Oriented armature from Pose > Apply, then adding a bone to the Original and running Update Oriented Armature" %}

**Create** renames the armature `<name>_Original` and adds a new `<name>_Oriented`, with matching bones aimed along the closest axis and constraints binding the original's bones to it. The original is parented to the oriented armature and displayed as wire, with both shown in front. Socket meshes on it are converted to skeletal, and its meshes follow the new parent. With **Retarget Actions** on, the original's active and stashed actions are retargeted onto the oriented armature and stashed there, and both armatures finish at rest. An existing Rigging child armature is handed over to sit above the new pair.

**Update** adds any bones the original has that the oriented doesn't, and reassigns the shapes. It doesn't retarget actions, so **Retarget Actions** has no effect on an existing pair, and it doesn't remove oriented bones the original no longer has.

The settings are remembered on every armature in the hierarchy. Running from the menu fills in anything not passed in from what the hierarchy remembers. For shapes that's a remembered shape that still exists, otherwise a single shape all its bones share. An existing pair with nothing to go on keeps its per bone shapes until you pick a shape in the redo panel, and a remembered shape file that's been removed falls back to None. The Orientation panel passes its own **Max Length**, **Original Shape** and **Oriented Shape** once the operator has run on that armature. The original's shape is scaled to 0.4 because it's an overlay, whenever a shape is assigned.

- **Max Length** (`max_length`) — Float; default 0.1; min 0. Clamp oriented armature bones down to this length if they would otherwise be longer. 0 turns clamping off.
- **Retarget Actions** (`actions`) — Checkbox; default On. Retarget the originals active action and stashed actions onto the oriented armature. Only used when creating.
- **Original Shape** (`original_shape`) — Choice; default remembered from the hierarchy; dynamic list. Custom shape for the original armatures bones.
- **Oriented Shape** (`oriented_shape`) — Choice; default remembered from the hierarchy; dynamic list. Custom shape for the oriented armatures bones.
