---
title: Set Bone Orientation
parent: Orientation
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/orientation/set-bone-orientation/
---

# Set Bone Orientation

**Operator:** `mmt.orient`  
**Label:** Set Bone Orientation

Orients bone tails and rolls to align axes in the input space.

## Location

- `Pose > Apply > Set Bone Orientation`
- F3 Operator Search, which also works in Edit mode

## Requirements

- An active armature with selected bones, in Pose or Edit mode. There's no `poll()` check, so this comes from what the operator reads.

## Usage

1. Select the bones to orient.
2. Run the operator.
3. Set **Space**, then **Primary** and **Secondary** in the redo panel if it isn't Auto.

{% include media/screenshot.html alt="Redo panel of Set Bone Orientation in the 3D Viewport in Pose mode, with a chain of bones selected and Space set to Local." %}

## Result

- Each selected bone keeps its head and length, with its tail pointing along **Primary** and its roll aligned to **Secondary**.
- **Auto** works it out from the bone's children, parent and chain, using the matching bone on the Original armature when there is one.
- Mesh children parented directly to a selected bone are converted to skeletal and back, so they stay in place.
- On an Oriented armature, keyed rotation and location in its actions are corrected so they keep looking the same.
- When the armature has both an Oriented and Original tier, the Original's parent constraints are refreshed.
- The previous mode, selection and hidden state are restored.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Space<br>`space` | Choice | Auto | **Auto**<br>**Local**<br>**Target**<br>**Armature** | The desired space to orient the bone in. |
| Target Bone<br>`target` | Text | Empty |  | The bone to define space from.<br>*Space is Target.* |
| Primary<br>`primary` | Choice | +Y | **+X**<br>**-X**<br>**+Y**<br>**-Y**<br>**+Z**<br>**-Z** | The desired tail direction of the bone.<br>*Space isn't Auto.* |
| Secondary<br>`secondary` | Choice | +Z | **+X**<br>**-X**<br>**+Y**<br>**-Y**<br>**+Z**<br>**-Z** | The desired roll direction of the bone.<br>*Space isn't Auto. The row turns red when it shares an axis with Primary.* |

## Variants

### Space

- **Auto** derives the axes from the hierarchy, and greys out **Primary** and **Secondary**.
- **Local** uses the bone's own current axes.
- **Target** uses the axes of **Target Bone**.
- **Armature** uses the armature's cardinal axes.

## Limitations

- It quietly does nothing while **Primary** and **Secondary** share an axis, or while **Space** is Target without a valid bone.
- **Warning:** this changes rest orientation. On armatures that aren't tagged Oriented, keyed animation isn't corrected.
- With **Auto**, a bone with no match on the hierarchy armature is skipped.

## Related Operators

- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}): Does this for a whole armature while building its oriented copy.
- [Refresh Binding Constraints]({% link docs/all-the-tools/rigging/refresh-binding-constraints.md %}): The same parent constraint refresh, run on its own.
- [Socket Meshes]({% link docs/all-the-tools/skinning/socket-meshes.md %}): The same socket and unsocket conversion used around this.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
