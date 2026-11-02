---
title: Retarget
parent: Retargeting
grand_parent: All The Tools
nav_order: 4
permalink: /all_the_tools/retargeting/retarget/
---

# Retarget

**Operator:** `mmt.actions`  
**Label:** Retarget

Retargets actions between the active armature and another one, in either direction.

## Location

- `Pose > Apply > Retarget Actions To`
- `Pose > Apply > Retarget Actions From`
- F3 Operator Search, which uses the From direction

## Requirements

- An active armature.

## Usage

1. Make the armature active.
2. Pick **Retarget Actions To** or **Retarget Actions From**.
3. Pick a **Target** in the redo panel. Nothing happens until you do.
4. Adjust the other settings in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Pose mode with the Retarget redo panel showing a Target armature picked, and the Pose > Apply menu entries for To and From." %}

## Result

- The source armature's active action and its stashed actions are each retargeted onto the receiving armature.
- The new action from the source's active action is made active on the receiver, and the rest are stashed.
- If the source had no active action, or it failed, the receiver's active action is cleared and its pose reset.
- With **Keep Original** on, new actions are prefixed with the receiving armature's Original name. Off, the source actions and their stash entries are removed and the new actions take their names.
- The active armature and its mode are restored, and anything hidden goes back to hidden.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Target<br>`target` | Choice | None, reset every time | Dynamic list | Armature to retarget actions with. |
| Only Selected<br>`only_selected` | Checkbox | Off |  | Only retarget bones that are currently selected, leaving unselected bones untouched. |
| Keep Original<br>`keep_original` | Checkbox | On |  | Keep the source actions, prefixing the new ones with the receiving armatures name. Disable to remove the source actions instead, renaming the new ones onto their old names. |
| Step Height<br>`step_height` | Float | 0.1 | Min 0 | How far a plantigrade foot's heel needs to lift before its parent fully hands the ball's own hinge rotation over to the foot control, rather than carrying it directly. |

## Variants

### Direction

- `FROM` pulls actions from the target onto the active armature. This is **Retarget Actions From**.
- `TO` pushes actions from the active armature onto the target. This is **Retarget Actions To**.

### Which armature gets used

- The active armature's side uses the highest tier in its hierarchy, whichever tier is active.
- **Target** lists each other character at its highest tier, plus the active armature's own Oriented when it isn't the active object.
- A receiver with a Rigging armature gets its result baked through its rigging, and that's where **Step Height** matters.

## Limitations

- **Only Selected** looks at bone selection on the receiving armature.
- Each bone uses its own Rotation and Translation retargeting settings from the Retargeting panel.
- An action with no bones matching the receiver is skipped.
- **Warning:** with **Keep Original** off, source actions are deleted.

## Related Operators

- [Retarget Pose]({% link docs/all_the_tools/retargeting/retarget_pose.md %}): Matches the two skeletons' rest poses first, when they differ.
- [Add Mapping]({% link docs/all_the_tools/retargeting/add_mapping.md %}): Lets differently named bones match.
- [Decimate Keyframes]({% link docs/all_the_tools/retargeting/decimate_keyframes.md %}): Cleans up keys, as the import's Cleaning panel does after retargeting.
- [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}): Can run this same retarget on an armature's own actions.
- [Import Mr Mannequins FBX]({% link docs/all_the_tools/importing/import_mr_mannequins_fbx.md %}): Can run this on animation only files while importing.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
