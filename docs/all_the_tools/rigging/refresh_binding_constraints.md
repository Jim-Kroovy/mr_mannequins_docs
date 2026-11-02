---
title: Refresh Binding Constraints
parent: Rigging
grand_parent: All The Tools
nav_order: 6
permalink: /all_the_tools/rigging/refresh_binding_constraints/
---

# Refresh Binding Constraints

**Operator:** `mmt.refresh`  
**Label:** Refresh Binding Constraints

Refreshes Child Of constraints on oriented and original armatures.

## Location

- `Pose > Apply > Refresh Binding Constraints`
- F3 Operator Search

## Requirements

- An active armature with an Oriented armature in its hierarchy. Greyed out with "Requires an Oriented armature" otherwise.

## Usage

1. Make any armature in the hierarchy active.
2. Run the operator.

## Result

- The original's constraints to the oriented armature are refreshed, and the oriented's constraints to the Rigging armature when there is one.

## Properties

This operator has no settings.

## Related Operators

- [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}): Creates the first set of these constraints.
- [Set Bone Orientation]({% link docs/all_the_tools/orientation/set_bone_orientation.md %}): Does this refresh itself after changing bones.
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %}): Rebuilds the modules as well.

## Related Documentation

- Planned: the Rapid Rigging module guides.
