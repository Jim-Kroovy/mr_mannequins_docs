---
title: Socket Meshes
parent: Skinning
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/skinning/socket_meshes/
---

# Socket Meshes

**Operator:** `mmt.socket`  
**Label:** Socket Meshes

Attaches single weighted skeletal meshes to their armature to make them correctly oriented socket meshes, or detaches them back to skeletal meshes.

## Location

- `Object > Apply > Socket Meshes`
- `Object > Apply > Unsocket Meshes`
- F3 Operator Search, which uses Socket

## Requirements

- **Socket:** selected visible meshes with an armature modifier, and exactly one vertex group with weight that matches a bone.
- **Unsocket:** selected visible meshes parented to a bone.

## Usage

1. Select the meshes in Object mode.
2. Choose **Socket Meshes** or **Unsocket Meshes**.
3. Set the suffix option in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Object mode with a prop mesh selected and the Object > Apply menu open showing Socket Meshes and Unsocket Meshes." %}

## Result

- **Socket:** the armature modifiers and that vertex group are removed. The mesh's origin moves to the bone's head and it's parented to the bone, with its rotation applied.
- **Unsocket:** all vertices get full weight in a group named after the bone, an armature modifier is added, the parenting is cleared, and location and rotation are applied. Scale isn't.
- Armatures sit in rest position while this runs, then go back to pose position.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Suffices<br>`suffices` | Checkbox | Off |  | Add or strip the parent bone's name as a suffix on the mesh name.<br>*Labelled Add Suffices on Socket and Remove Suffices on Unsocket. Off from the menu.* |

## Variants

### Mode

- `SOCKET` is **Socket Meshes**.
- `UNSOCKET` is **Unsocket Meshes**.

## Limitations

- Meshes that don't qualify are skipped with no message.
- A name that already ends with the bone name doesn't get it again.

## Related Operators

- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}): Exports socket meshes, adding its own optional bone suffix.
- [Set Bone Orientation]({% link docs/all_the_tools/orientation/set_bone_orientation.md %}): Does this conversion on bones it changes.
- [Weight Meshes]({% link docs/all_the_tools/skinning/weight_meshes.md %}): Makes the single bone weighting this looks for.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
