---
title: Retarget Pose
parent: Retargeting
grand_parent: All The Tools
nav_order: 5
permalink: /all-the-tools/retargeting/retarget-pose/
---

# Retarget Pose

**Operator:** `mmt.pose`  
**Label:** Retarget Pose

Sets or applies a retarget pose. Set poses the active armature into a target's bone directions only, without touching names, meshes or actions, so it can be cleaned up by hand. Apply then bakes that pose onto the meshes and rest pose, carrying stashed actions along.

## Location

- `Pose > Apply > Set Retarget Pose`
- `Pose > Apply > Apply Retarget Pose`
- F3 Operator Search, which uses the Set mode

## Requirements

- An active armature that isn't tagged Rigging. Greyed out with "Requires an Original or Oriented armature, not Rigging" otherwise.

## Usage

1. Make the Original or Oriented armature active.
2. Run **Set Retarget Pose** and pick a **Target** in the redo panel.
3. Clean the pose up by hand if it needs it.
4. Run **Apply Retarget Pose**, which reuses the last target.
5. Set **Max Length**, **Rename Bones** and **Enforce Hierarchy** in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Pose mode with an armature posed into a target's bone directions and the Retarget Pose redo panel open showing Target." %}

## Result

- **Set:** the armature is posed into the target's bone directions and left in Pose mode.
- **Apply:** the current pose is baked into the meshes and becomes the original's rest pose, its constraints are cleared, and its bones take the target's orientation while keeping their own lengths.
- An existing Oriented armature is replaced by a rebuilt one with the same name, and its actions are carried across.
- Without an Oriented armature, only the Original gets applied. Building one is left to [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}).
- Socket meshes get converted to skeletal, and anything hidden goes back to hidden.

## Properties

### Redo panel, both modes

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Target<br>`target` | Choice | None for Set, last used for Apply | Dynamic list | Armature to pose (or retarget) the active armature against. |

### Redo panel, Set

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Only Selected<br>`only_selected` | Checkbox | Off |  | Only pose bones that are currently selected, leaving unselected bones untouched.<br>*Set mode.* |

### Redo panel, Apply

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Max Length<br>`max_length` | Float | 0 | Min 0 | Clamp retargeted armature bones down to this length after positioning them.<br>*Apply mode. 0 turns clamping off.* |
| Rename Bones<br>`rename` | Checkbox | On |  | Rename bones onto the targets own naming wherever a bone mapping resolves one, so this armature fully matches the target - names, orientations and retargeting settings alike. Disable to keep this armatures own names, eg. to reuse them in a different pose.<br>*Apply mode.* |
| Enforce Hierarchy<br>`enforce_hierarchy` | Checkbox | On |  | Pad any chain the target has more bones in than this armature does, so both skeletons keep the same joint count - injected bones are positioned proportionally to this armatures own real bone gap, but oriented like their own target counterpart, and the transported animation is split evenly across them rather than left concentrated on the one bone that used to carry all of it.<br>*Apply mode.* |

## Variants

### Mode

- `SET` is **Set Retarget Pose**. Each run from the menu resets **Target** to None, and nothing happens until one is picked.
- `APPLY` is **Apply Retarget Pose**. It keeps the last target so it isn't picked twice.

### Which target gets used

- **Target** lists each other character at its Oriented tier, or its Original if it has no Oriented.
- Whatever's picked resolves to that character's Oriented, or its Original. Nothing happens when that's the active armature itself.

## Limitations

- Everything else gets deselected before it runs, so other armatures don't get pulled into Pose mode.
- **Warning:** Apply changes rest poses and bakes meshes. No branch of Apply rebuilds an existing Rigging armature above the pair.
- With **Only Selected**, unselected bones follow whatever their posed parent gives them.

## Related Operators

- [Retarget]({% link docs/all-the-tools/retargeting/retarget.md %}): Retargets actions once the rest poses match.
- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}): Builds the oriented armature when Apply leaves only an Original.
- [Add Mapping]({% link docs/all-the-tools/retargeting/add-mapping.md %}): Lets differently named bones match.
- [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %}): Runs the same steps on imported skeletal meshes with a Target.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
