---
title: Set Bone Orientation
parent: Orientation
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/orientation/set_bone_orientation/
---

# Set Bone Orientation

**Set Bone Orientation** (`mmt.orient`) orients bone tails and rolls to align axes in the input space. It's at `Pose > Apply > Set Bone Orientation` and in F3 Operator Search, which also works in Edit mode. It needs an active armature with selected bones, in Pose or Edit mode. There's no `poll()` check, so this comes from what the operator reads.

Each selected bone keeps its head and length, with its tail pointing along **Primary** and its roll aligned to **Secondary**. **Auto** works it out from the bone's children, parent and chain, using the matching bone on the Original armature when there is one, and a bone with no match on the hierarchy armature is skipped. Mesh children parented directly to a selected bone are converted to skeletal and back, so they stay in place. When the armature has both an Oriented and Original tier, the Original's parent constraints are refreshed. The previous mode, selection and hidden state are restored.

On an Oriented armature, keyed rotation and location in its actions are corrected so they keep looking the same. **Warning:** this changes rest orientation, and on armatures that aren't tagged Oriented, keyed animation isn't corrected. It quietly does nothing while **Primary** and **Secondary** share an axis, or while **Space** is Target without a valid bone.

- **Space** (`space`) — Choice; default Auto; The desired space to orient the bone in.
  - **Auto**: Derives the axes from the hierarchy, and greys out **Primary** and **Secondary**.
  - **Local**: Uses the bone's own current axes.
  - **Target**: Uses the axes of **Target Bone**.
  - **Armature**: Uses the armature's cardinal axes.
- **Target Bone** (`target`) — Text; default empty. The bone to define space from. Available when Space is Target.
- **Primary** (`primary`) — Choice; default +Y; options **+X**, **-X**, **+Y**, **-Y**, **+Z**, **-Z**. The desired tail direction of the bone. Available when Space isn't Auto.
- **Secondary** (`secondary`) — Choice; default +Z; options **+X**, **-X**, **+Y**, **-Y**, **+Z**, **-Z**. The desired roll direction of the bone. Available when Space isn't Auto. The row turns red when it shares an axis with Primary.
