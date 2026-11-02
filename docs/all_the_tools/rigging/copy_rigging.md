---
title: Copy Rigging
parent: Rigging
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/rigging/copy_rigging/
---

# Copy Rigging

**Copy Rigging** (`mmt.copy`) copies or pastes every rigging module's type and settings via the add-on preferences, so they can be rebuilt onto another armature. It's in the down arrow menu at `Properties > Armature > Rigging Modules` as **Copy Rigging** and **Paste Rigging**, and in F3 Operator Search, which uses Copy. It needs an active armature in Object or Pose mode, with an Oriented armature in its hierarchy.

**Copy** puts the type and settings of every primary module on a clipboard stored in the add-on preferences, and a mirrored counterpart isn't copied separately. It warns and cancels when there are no modules. **Paste** adds and rebuilds each module from the clipboard on top of any modules already on the armature, creating a Rigging armature if there isn't one, and warns and cancels when the clipboard is empty. Optional roles the destination doesn't have are cleared before building, so a different but compatible skeleton can still take them. A module that can't find its bones is removed, and a warning lists what couldn't be pasted. If every module fails, the new Rigging armature is removed again.

- **Mode** (`mode`) — Choice; default Copy; options **Copy**, **Paste**. Whether we're copying rigging from this armature or pasting it onto this armature. Hidden. Set by the menu entry.
