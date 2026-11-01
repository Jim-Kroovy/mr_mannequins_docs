---
title: Transfer Root Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 5
permalink: /all-the-tools/keyframing/transfer-root-motion/
---

# Transfer Root Motion

**Operator:** `mmt.transfer_motion`  
**Label:** Transfer Root Motion

Transfers the source bone's travel along a world direction onto the target bone (eg. root motion) in every listed action, keying location only.

## Location

- `Pose > Apply > Transfer Root Motion`
- F3 Operator Search

## Requirements

- An active armature in Pose mode.
- NLA tweak mode off on the armature.

## Usage

1. Select the source bone, then make the target bone active. They fill in **Source** and **Target**.
2. Open the operator. It lists the active action on its own, otherwise every action on the selected NLA tracks, otherwise one blank row to pick from.
3. Set the **Direction** for each action.
4. Confirm the dialog.

{% include media/screenshot.html alt="Transfer Root Motion dialog in the 3D Viewport in Pose mode, with the pelvis as Source, the root as Target and one action listed." %}

## Result

- In each listed action, the source's travel along that direction moves to the target, keyed on every whole frame inside the action's frame range.
- The actions are edited in place, and only the location curves of the two bones change.
- The previously active action, pose and frame are restored.
- A report lists the actions and the frame count.

## Properties

### Dialog

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Source<br>`source_bone` | Text | From selection |  | The bone whose directional travel gets moved onto the target. (eg. the pelvis)<br>*Filled in when the dialog opens: the first selected bone that isn't active.* |
| Target<br>`target_bone` | Text | From selection |  | The bone that receives the directional travel. (eg. the root)<br>*Filled in when the dialog opens: the active bone.* |

### Per action boxes

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Action<br>`action` | Text | Empty |  | The action to transfer motion in.<br>*One box per listed action.* |
| Direction<br>`direction` | Float x3, xyz | (0, 1, 0) | Unbounded | The world space direction of travel to transfer for this action. |

## Limitations

- Blank rows are skipped. Anything unfinished or invalid quietly does nothing and leaves the redo panel up, with no pop-ups.
- It's all or nothing: if any listed action fails, every action goes back as it was.
- An action fails when it's linked or read only, listed twice, has a zero direction, has no whole frame to sample, or has no slot that animates the armature.
- The transfer fails if a bone's location can't fully drive it at some frame, so check its constraints and scale.
- A source that follows the target already carries the target's travel, so only what's left gets transferred.

## Related Operators

- [Redirect Root Motion]({% link docs/all-the-tools/keyframing/redirect-root-motion.md %}): Rotates the root motion this creates onto new directions.
- [Split Active Action]({% link docs/all-the-tools/keyframing/split-active-action.md %}): Stashes split actions, which can then be listed here from their NLA tracks.
- [Generate Locomotion]({% link docs/all-the-tools/keyframing/generate-locomotion.md %}): Can generate root travel directly instead.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
