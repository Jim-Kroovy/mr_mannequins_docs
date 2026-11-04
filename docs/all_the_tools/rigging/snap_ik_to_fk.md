---
title: Snap IK to FK
parent: Rigging
grand_parent: All The Tools
nav_order: 8
permalink: /all_the_tools/rigging/snap_ik_to_fk/
---

# Snap IK to FK

**Snap IK to FK** (`mmt.snap`) snaps the active module's kinematics between its forward pose and its IK controls, so switching between them doesn't pop. The **Snap IK to FK** and **Snap FK to IK** buttons are at `3D Viewport > Sidebar > Animation > Controls` and `Properties > Armature > Rigging Modules > Controls`, on Opposable, Plantigrade, Digitigrade, Scalar and Spline modules. It's also in F3 Operator Search, which uses IK to FK.

{% include media/youtube.html title="Snapping an Opposable Arm's IK controls onto its forward pose with Snap IK to FK, then back with Snap FK to IK, switching without a pop" %}

It needs an active, selected Oriented or Rigging armature in Pose mode with a Rigging armature, and an active bone in a module or a valid active module in the list. The active bone's module is used first, and the active module in the list is the fallback.

**IK to FK** snaps the module's IK controls onto its current forward pose, and warns that snapping isn't supported on other module types. **FK to IK** sends the module's forward pose back to its existing IK solution: each forward bone's user rotation is cleared, and rotation is handed back to its Copy Offset Rotation constraint where it has one. Both directions warn when the module may not be fully built.

- **Direction** (`direction`) — Choice; default IK to FK. Which way to snap the active modules kinematics. Hidden. Set by the button.
  - **IK to FK**: Snap the modules ik controls onto its current forward pose
  - **FK to IK**: Return the modules forward pose to its existing ik solution
