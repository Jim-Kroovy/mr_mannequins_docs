---
title: Copy Rigging
parent: Rigging
grand_parent: All The Tools
nav_order: 2
permalink: /all-the-tools/rigging/copy-rigging/
---

# Copy Rigging

**Operator:** `mmt.copy`  
**Label:** Copy Rigging

Copies or pastes every rigging module's type and settings via the add-on preferences, so they can be rebuilt onto another armature.

## Location

- `Properties > Armature > Rigging Modules`, the down arrow menu, **Copy Rigging** and **Paste Rigging**
- F3 Operator Search, which uses Copy

## Requirements

- An active armature in Object or Pose mode, with an Oriented armature in its hierarchy.

## Usage

1. With the rigged armature active, choose **Copy Rigging**.
2. With the other armature active, choose **Paste Rigging**.

## Result

- **Copy:** the type and settings of every primary module go on a clipboard stored in the add-on preferences. A mirrored counterpart isn't copied separately.
- **Paste:** each module is added and rebuilt from the clipboard. A Rigging armature is created if there isn't one.
- Optional roles the destination doesn't have are cleared before building, so a different but compatible skeleton can still take them.

## Properties

### Set by the menu entry

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Mode<br>`mode` | Choice | Copy | **Copy**<br>**Paste** | Whether we're copying rigging from this armature or pasting it onto this armature.<br>*Hidden. Set by the menu entry.* |

## Limitations

- Copy warns and cancels when there are no modules, and Paste warns and cancels when the clipboard is empty.
- A module that can't find its bones is removed, and a warning lists what couldn't be pasted.
- If every module fails, the new Rigging armature is removed again.
- Paste adds to any modules already on the armature.

## Related Operators

- [Add Rigging Module]({% link docs/all-the-tools/rigging/add-rigging-module.md %}): Adds modules one at a time.
- [Rebuild Rigging]({% link docs/all-the-tools/rigging/rebuild-rigging.md %}): Rebuilds modules in place, with no clipboard.

## Related Documentation

- Planned: the Rapid Rigging module guides.
