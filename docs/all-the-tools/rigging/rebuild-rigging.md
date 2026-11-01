---
title: Rebuild Rigging
parent: Rigging
grand_parent: All The Tools
nav_order: 5
permalink: /all-the-tools/rigging/rebuild-rigging/
---

# Rebuild Rigging

**Operator:** `mmt.rebuild`  
**Label:** Rebuild Rigging

Rebuilds all rigging modules from their current settings.

## Location

- `Properties > Armature > Rigging Modules`, the down arrow menu, **Rebuild Rigging**
- F3 Operator Search

## Requirements

- An active armature in Object or Pose mode, with an Oriented armature in its hierarchy.

## Usage

1. Make any armature in the hierarchy active.
2. Choose **Rebuild Rigging**.

## Result

- Every primary module and its mirrored counterpart are removed and rebuilt from their settings, and the list order is restored.

## Properties

This operator has no settings.

## Limitations

- Empty modules with no type are dropped.
- It does nothing when the hierarchy has no Rigging armature.

## Related Operators

- [Copy Rigging]({% link docs/all-the-tools/rigging/copy-rigging.md %}): Rebuilds modules onto a different armature.
- [Refresh Binding Constraints]({% link docs/all-the-tools/rigging/refresh-binding-constraints.md %}): Only refreshes constraints, without rebuilding.
- [Move Rigging Module]({% link docs/all-the-tools/rigging/move-rigging-module.md %}): Sets the order this rebuilds in.

## Related Documentation

- Planned: the Rapid Rigging module guides.
