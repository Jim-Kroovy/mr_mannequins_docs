---
title: Redirect Root Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 3
permalink: /all-the-tools/keyframing/redirect-root-motion/
---

# Redirect Root Motion

**Operator:** `mmt.redirect_motion`  
**Label:** Redirect Root Motion

Rotates the active root bone's animation, and every independent control, around a world axis through the world origin. Any other selected bones get rotated back around the root to counter it.

## Location

- `Pose > Apply > Redirect Root Motion`
- F3 Operator Search

## Requirements

- An active armature in Pose mode with an active pose bone on it, which is treated as the root.
- NLA tweak mode off on the armature.

## Usage

1. Make the root bone active, and select any bones that should be countered.
2. Open the operator. It lists the active action on its own, otherwise every action on the selected NLA tracks, otherwise one blank row to pick from.
3. Set **Directions** for each action, then an axis, angle and new name for each direction.
4. Set **Keep Original** and **Stash Action**.
5. Confirm the dialog.

{% include media/screenshot.html alt="Redirect Root Motion dialog in the 3D Viewport in Pose mode, listing one action with Directions set to 3 and an axis, angle and name on each row." %}

## Result

- Each direction makes a redirected copy of the untouched source action. A taken name gets a `.001` style suffix.
- A kept original gets stashed if the NLA isn't already holding it, and the redirected copies get stashed when **Stash Action** is on.
- When originals are kept and results are stashed, whatever was active stays active. Otherwise the last redirected action becomes active.
- A report lists the new actions, along with any countered chains and controls.

## Properties

### Per action boxes

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Action<br>`action` | Text | Empty |  | The action to redirect.<br>*One box per listed action.* |
| Directions<br>`direction_count` | Integer | 1 | Min 1, Max 64 | How many redirected actions to make from this action, one per direction. |

### Direction rows

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Axis<br>`axis` | Choice | Z | **X**<br>**Y**<br>**Z** | The world space axis to rotate the motion around.<br>*One row per Directions.* |
| Angle<br>`angle` | Float, angle | 0° | Unbounded | How far to rotate the motion around the axis. |
| New Action<br>`action_name` | Text | Empty |  | The name of this new redirected action. (a taken name gets a .001 style suffix)<br>*New rows are named after the action.* |

### Dialog options

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Keep Original<br>`keep_original` | Checkbox | On |  | Keep the original action as it is, otherwise it gets removed once the redirected action has been made. |
| Stash Action<br>`stash_action` | Checkbox | On |  | Stash the redirected action in the NLA, named after the redirected action.<br>*Greyed out and forced on when there's more than one new action, or the actions came from the NLA.* |

## Limitations

- Nothing is redirected until an angle is set. A blank list just finishes, and every direction at zero reports that an angle is needed.
- All directions need a name. A zero angle on one direction while another is set is an error.
- An original can't be removed while another data-block is using it.
- Countering doesn't support a selected bone with more than one selected child, or a selected parentless bone that follows through a Child Of constraint.
- An independent control is a parentless bone with no Child Of constraint.
- Redirecting clears the transforms of the selected bones and restores the rest of the pose.
- Failures report an error and cancel without leaving partial results.

## Related Operators

- [Transfer Root Motion]({% link docs/all-the-tools/keyframing/transfer-root-motion.md %}): Moves travel onto the root, which is often what you want before redirecting it.
- [Split Active Action]({% link docs/all-the-tools/keyframing/split-active-action.md %}): Stashes split actions, which can then be listed here from their NLA tracks.
- [Export Mr Mannequins FBX]({% link docs/all-the-tools/exporting/export-mr-mannequins-fbx.md %}): Exports the stashed results by default.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
