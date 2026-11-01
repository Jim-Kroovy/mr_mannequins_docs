---
title: Add Oscillatory Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/keyframing/add-oscillatory-motion/
---

# Add Oscillatory Motion

**Operator:** `mmt.generate_loops`  
**Label:** Add Oscillatory Motion

Layers looping world space location and rotation offsets, and local scale factors, onto the selected bones of the active action, in place.

## Location

- `Pose > Apply > Add Oscillatory Motion`
- F3 Operator Search

## Requirements

- An active armature in Pose mode.
- An active action that isn't linked or read only.
- At least one selected bone.

## Usage

1. Select the bones to loop and move to the first frame you want generated.
2. Open the operator.
3. Set **Speed**, **Frequency** and **Loops**.
4. Set the min and max values for each bone listed in the dialog.
5. Confirm the dialog.

{% include media/screenshot.html alt="Add Oscillatory Motion dialog in the 3D Viewport in Pose mode, with two bones selected and their per bone boxes visible." %}

## Result

- The offsets are added on top of what the action already does, from the current frame for `Loops × frames per base loop` frames.
- Generated keys are linear. Keys outside the generated range keep their handles.
- The action is marked as cyclic over the generated range, with Cycles modifiers on the keyed curves, and the scene frame range is set to it, leaving off the final key.
- Playback starts if the timeline isn't already playing.
- A report gives the bone count, frame count and frames per loop, and the actual speed when frame rounding changes it by more than 1%.

## Properties

### Dialog

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Speed<br>`speed` | Float | 1 | Min 0.001 | How many base loops happen per second. |
| Frequency<br>`frequency` | Integer | 1 | Min 1 | How many complete oscillations happen per base loop. |
| Loops<br>`loop_count` | Integer | 1 | Min 1 | How many base loops to generate. |

### Per bone boxes

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Min Location<br>`minimum_location` | Float x3, translation | (0, 0, 0) | Unbounded | The world space X, Y and Z offset the loop starts and ends each oscillation at.<br>*One box per selected bone, in name order.* |
| Max Location<br>`maximum_location` | Float x3, translation | (0, 0, 0) | Unbounded | The world space X, Y and Z offset the loop reaches halfway through each oscillation. |
| Min Rotation<br>`minimum_rotation` | Float x3, euler | (0°, 0°, 0°) | Unbounded | The world space X, Y and Z angles the loop starts and ends each oscillation at. |
| Max Rotation<br>`maximum_rotation` | Float x3, euler | (0°, 0°, 0°) | Unbounded | The world space X, Y and Z angles the loop reaches halfway through each oscillation. |
| Min Scale<br>`minimum_scale` | Float x3, xyz | (1, 1, 1) | Min 0.001 | The local X, Y and Z scale factors the loop starts and ends each oscillation at. (multiplies the actions own scale, 1.0 changes nothing) |
| Max Scale<br>`maximum_scale` | Float x3, xyz | (1, 1, 1) | Min 0.001 | The local X, Y and Z scale factors the loop reaches halfway through each oscillation. (multiplies the actions own scale, 1.0 changes nothing) |
| Cycle Offset<br>`cycle_offset` | Float, factor | 0 | Min 0, Max 1 | Shifts this bones oscillation along by a fraction of one oscillation. |

## Limitations

- A bone with all location and rotation values at zero and all scale values at 1 isn't touched.
- Scale is only solved and keyed for bones that use it.
- Every frame is solved before any key is written. If a bone can't reach its transform the operator reports it and cancels without changing the action.
- If the action's own motion doesn't match at the first and last generated frame, a warning says it won't loop cleanly. The offsets themselves still do.
- Values already listed for a selected bone are kept the next time the dialog opens in the session.

## Related Operators

- [Generate Locomotion]({% link docs/all-the-tools/keyframing/generate-locomotion.md %}): Generates a full gait into a new action, rather than layering onto an existing one.
- [Split Active Action]({% link docs/all-the-tools/keyframing/split-active-action.md %}): Splits an action into ranges first, when only part of it should loop.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
