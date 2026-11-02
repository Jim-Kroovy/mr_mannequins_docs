---
title: Snap IK to FK
parent: Rigging
grand_parent: All The Tools
nav_order: 8
permalink: /all_the_tools/rigging/snap_ik_to_fk/
---

# Snap IK to FK

**Operator:** `mmt.snap`  
**Label:** Snap IK to FK

Snaps the active module's kinematics between its forward pose and its IK controls, so switching between them doesn't pop.

## Location

- `3D Viewport > Sidebar > Animation > Controls`, **Snap IK to FK** and **Snap FK to IK**
- `Properties > Armature > Rigging Modules > Controls`, the same two buttons
- F3 Operator Search, which uses IK to FK

## Requirements

- An active, selected Oriented or Rigging armature in Pose mode with a Rigging armature.
- An active bone in a module, or a valid active module in the list.

## Usage

1. Select a bone in the module.
2. Press **Snap IK to FK** or **Snap FK to IK**.

{% include media/screenshot.html alt="3D Viewport sidebar Animation tab in Pose mode, with the Controls panel on an Opposable Arm module showing both snap buttons." %}

## Result

- **IK to FK:** the module's IK controls are snapped onto its current forward pose.
- **FK to IK:** the module's forward pose goes back to its existing IK solution. Each forward bone's user rotation is cleared, and rotation is handed back to its Copy Offset Rotation constraint where it has one.

## Properties

### Set by the button

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Direction<br>`direction` | Choice | IK to FK | **IK to FK**: Snap the modules ik controls onto its current forward pose<br>**FK to IK**: Return the modules forward pose to its existing ik solution | Which way to snap the active modules kinematics.<br>*Hidden. Set by the button.* |

## Variants

### Which module gets snapped

- The active bone's module is used first, and the active module in the list is the fallback.
- The buttons are on Opposable, Plantigrade, Digitigrade, Scalar and Spline modules.

## Limitations

- IK to FK warns that snapping isn't supported on other module types.
- Both directions warn when the module may not be fully built.

## Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}): Builds the modules this works on.
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %}): Rebuilds a module that isn't fully built.

## Related Documentation

- Planned: the Rapid Rigging module guides.
