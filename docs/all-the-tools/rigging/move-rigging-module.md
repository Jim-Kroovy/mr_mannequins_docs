---
title: Move Rigging Module
parent: Rigging
grand_parent: All The Tools
nav_order: 4
permalink: /all-the-tools/rigging/move-rigging-module/
---

# Move Rigging Module

**Operator:** `mmt.move`  
**Label:** Move Rigging Module

Moves the selected rigging module up or down in the list.

## Location

- `Properties > Armature > Rigging Modules`, the up and down arrow buttons
- F3 Operator Search

## Requirements

- An active, selected Oriented or Rigging armature in Pose mode, with a Rigging armature and a valid active module.

## Usage

1. Pick the module in the list.
2. Press the up or down arrow.

## Result

- The module moves one place and stays active.

## Properties

### Set by the button

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Direction<br>`direction` | Choice | Up | **Up**<br>**Down** | Which way to move the selected module.<br>*Set by the arrow buttons. The redo panel also shows it.* |

## Limitations

- Nothing happens at the end of the list.

## Related Operators

- [Add Rigging Module]({% link docs/all-the-tools/rigging/add-rigging-module.md %}): Adds modules to the list.
- [Remove Rigging Module]({% link docs/all-the-tools/rigging/remove-rigging-module.md %}): Removes modules from the list.
- [Rebuild Rigging]({% link docs/all-the-tools/rigging/rebuild-rigging.md %}): Rebuilds modules in list order.

## Related Documentation

- Planned: the Rapid Rigging module guides.
