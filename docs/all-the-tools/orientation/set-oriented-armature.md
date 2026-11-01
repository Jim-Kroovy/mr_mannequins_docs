---
title: Set Oriented Armature
parent: Orientation
grand_parent: All The Tools
nav_order: 2
permalink: /all-the-tools/orientation/set-oriented-armature/
---

# Set Oriented Armature

**Operator:** `mmt.oriented`  
**Label:** Set Oriented Armature

Makes a Blender compatible armature by orienting bones using shortest rolls by matching names, adding any new bones from the original.

## Location

- `Pose > Apply > Create Oriented Armature` or `Update Oriented Armature`, depending on whether the armature already has an oriented pair
- `Properties > Armature > Orientation`, with the same label
- F3 Operator Search

## Requirements

- An active armature. There's no `poll()` check, and it reads the armature hierarchy of the active object.

## Usage

1. Make the armature active.
2. Run the operator from the menu or the Orientation panel.
3. Adjust **Max Length**, **Retarget Actions** and the shapes in the redo panel.

{% include media/screenshot.html alt="Properties editor Armature tab with the Orientation panel showing Max Length, Original Shape, Oriented Shape and the Create Oriented Armature button." %}

## Result

- **Create:** the armature is renamed `<name>_Original` and a new `<name>_Oriented` is added, with matching bones aimed along the closest axis and constraints binding the original's bones to it.
- The original is parented to the oriented armature and displayed as wire, with both shown in front. Socket meshes on it are converted to skeletal, and its meshes follow the new parent.
- With **Retarget Actions** on, the original's active and stashed actions are retargeted onto the oriented armature and stashed there, and both armatures finish at rest.
- An existing Rigging child armature is handed over to sit above the new pair.
- **Update:** any bones the original has that the oriented doesn't are added, and the shapes get reassigned.
- The settings are remembered on every armature in the hierarchy.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Max Length<br>`max_length` | Float | 0.1 | Min 0 | Clamp oriented armature bones down to this length if they would otherwise be longer.<br>*0 turns clamping off.* |
| Retarget Actions<br>`actions` | Checkbox | On |  | Retarget the originals active action and stashed actions onto the oriented armature.<br>*Only used when creating.* |
| Original Shape<br>`original_shape` | Choice | Remembered, see below | Dynamic list | Custom shape for the original armatures bones. |
| Oriented Shape<br>`oriented_shape` | Choice | Remembered, see below | Dynamic list | Custom shape for the oriented armatures bones. |

## Variants

### Remembered values

- Running from the menu fills in anything not passed in from what the hierarchy remembers. For shapes that's a remembered shape that still exists, otherwise a single shape all its bones share.
- An existing pair with nothing to go on keeps its per bone shapes until you pick a shape in the redo panel.
- A remembered shape file that's been removed falls back to None.
- The Orientation panel passes its own **Max Length**, **Original Shape** and **Oriented Shape** once the operator has run on that armature.

### Shape scale

- The original's shape is scaled to 0.4 because it's an overlay. This applies whenever a shape is assigned.

## Limitations

- Updating doesn't retarget actions, so **Retarget Actions** has no effect on an existing pair.
- Updating doesn't remove oriented bones the original no longer has.

## Related Operators

- [Set Bone Orientation]({% link docs/all-the-tools/orientation/set-bone-orientation.md %}): Changes individual bone directions after this.
- [Retarget Pose]({% link docs/all-the-tools/retargeting/retarget-pose.md %}): Needs an Original or Oriented armature, and can rebuild the oriented one on Apply.
- [Refresh Binding Constraints]({% link docs/all-the-tools/rigging/refresh-binding-constraints.md %}): Refreshes the binding constraints this creates.
- [Add Rigging Module]({% link docs/all-the-tools/rigging/add-rigging-module.md %}): Needs an oriented armature before it can add rigging.
- [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %}): Can create an oriented armature while importing.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
- Planned: the Rapid Rigging module guides.
