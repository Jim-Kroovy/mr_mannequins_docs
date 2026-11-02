---
title: Remove Rigging Module
parent: Rigging
grand_parent: All The Tools
nav_order: 7
permalink: /all_the_tools/rigging/remove_rigging_module/
---

# Remove Rigging Module

**Operator:** `mmt.remove`  
**Label:** Remove Rigging Module

Removes a rigging module, deleting the bones and constraints it created. Shared origin and ending bones are kept.

## Location

- `Properties > Armature > Rigging Modules`, the **-** button
- F3 Operator Search

## Requirements

- An active, selected Oriented or Rigging armature in Pose mode, with a Rigging armature and a valid active module.

## Usage

1. Pick the module in the list.
2. Press **-**.

## Result

- A built module's own bones, drivers and constraints are removed, along with the constraints it drives on the Oriented armature.
- An empty module is just dropped from the list.
- Removing the last module also removes the Rigging armature, and goes back to the Oriented armature in Pose mode.

## Properties

This operator has no settings.

## Limitations

- A bone also used by another module stays.

## Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}): Adds the modules this removes.
- [Move Rigging Module]({% link docs/all_the_tools/rigging/move_rigging_module.md %}): Reorders the list.
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %}): Rebuilds modules instead of removing them.

## Related Documentation

- Planned: the Rapid Rigging module guides.
