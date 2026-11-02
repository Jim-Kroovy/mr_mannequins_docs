---
title: Generate Locomotion
parent: Keyframing
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/keyframing/generate_locomotion/
---

# Generate Locomotion

**Operator:** `mmt.generate_locomotion`  
**Label:** Generate Locomotion

Keys a looping procedural walk into a new action. The selected foot targets step in phase around the active one while the pelvis bobs, and the root can optionally travel.

## Location

- **F3 Operator Search** only. It isn't in a menu or panel.

## Requirements

- An active armature in Pose mode.
- An active pose bone that's selected, on that armature.
- At least two selected bones, which become the foot targets.

## Usage

1. Select the foot targets, with the lead foot active, and move to the first frame.
2. Run **Generate Locomotion** from F3.
3. Pick the **Root** and **Pelvis** bones, which can't be foot targets.
4. Set the direction, speed, step and pelvis settings, and add any swings.
5. Confirm the dialog.

{% include media/screenshot.html alt="Generate Locomotion dialog in the 3D Viewport in Pose mode, with two foot target bones selected and one swing box visible." %}

## Result

- A new action is keyed from the current frame and made active. Blender adds a `.001` style suffix if the name is taken.
- An active action that wasn't already in the NLA gets stashed first, so it isn't lost.
- One cycle lasts `Step Length / Speed` seconds at the scene frame rate, rounded to whole frames with a minimum of 2.
- Even numbers of feet alternate, odd numbers stagger evenly, and the feet are ordered around their footprint with the active foot first.
- Every key is linear, and the action is marked as cyclic with Cycles modifiers on its curves. With **Root Motion** on, location curves repeat with an offset.
- The scene frame range is set to the generated range, leaving off the final key.
- Playback starts if the timeline isn't already playing.
- A report gives the frames and bones keyed, and the actual speed when frame rounding changes it by more than 1%.

## Properties

### Dialog

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Action Name<br>`action_name` | Text | Empty |  | The name for the newly generated action.<br>*Suggests `<armature>_Locomotion` when empty.* |
| Root<br>`root_bone` | Text | Empty |  | The root bone, it travels along the direction when root motion is on. |
| Pelvis<br>`pelvis_bone` | Text | Empty |  | The pelvis bone that bobs up and down with each step. |
| Root Motion<br>`root_motion` | Checkbox | Off |  | Move the root (and everything with it) along the direction, otherwise the gait stays in place. |
| Direction<br>`direction` | Float x3, xyz | (0, 1, 0) | Unbounded | The world space direction of travel. (only its horizontal part is used) |
| Speed<br>`speed` | Float | 1 | Min 0.001 | How fast to travel, in world units per second. |
| Step Height<br>`step_height` | Float, distance | 0.2 | Min 0 | How high each foot lifts at the peak of its swing. |
| Step Length<br>`step_length` | Float, distance | 1 | Min 0.001 | How far the character travels with each full cycle of steps. |
| Pelvic Bob<br>`pelvic_bob` | Float, distance | 0.05 | Min 0 | How far the pelvis dips, twice per cycle. |
| Pelvis Offset<br>`pelvis_offset` | Float x3, xyz | (0, 0, 0) | Unbounded | A constant world space offset applied to the pelvis position. (negative Z crouches the character) |

### Pelvis Rotation Offset

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Pitch X<br>`pelvis_pitch_offset` | Float, angle | 0° | Unbounded | A constant pitch of the pelvis around the world X axis. |
| Yaw Z<br>`pelvis_yaw_offset` | Float, angle | 0° | Unbounded | A constant yaw of the pelvis around the world Z axis. |
| Roll Y<br>`pelvis_roll_offset` | Float, angle | 0° | Unbounded | A constant roll of the pelvis around the world Y axis. |

### Pelvic Rotation Bob

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Pitch X<br>`pelvic_pitch` | Float, angle | 0° | Unbounded | How far the pelvis pitches around the world X axis at the bottom of each dip. |
| Yaw Z<br>`pelvic_yaw` | Float, angle | 0° | Unbounded | How far the pelvis yaws around the world Z axis at the bottom of each dip. |
| Roll Y<br>`pelvic_roll` | Float, angle | 0° | Unbounded | How far the pelvis rolls around the world Y axis at the bottom of each dip. |

### Loops and swings

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Loops<br>`loop_count` | Integer | 1 | Min 1 | How many full cycles to generate. |
| Swing Count<br>`swing_count` | Integer | 0 | Min 0, Max 32 | How many extra bones to swing around a pivot bone.<br>*Adds or removes swing boxes from the end of the list.* |

### Swing boxes

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Bone<br>`bone` | Text | Empty |  | The bone to swing.<br>*One box per Swing Count.* |
| Pivot<br>`pivot` | Text | Empty |  | The bone to swing around, the swing follows it as it moves. |
| Min<br>`minimum` | Float x3, euler | (0°, 0°, 0°) | Unbounded | The world space X, Y and Z angles the swing starts and ends each oscillation at. |
| Max<br>`maximum` | Float x3, euler | (0°, 0°, 0°) | Unbounded | The world space X, Y and Z angles the swing reaches halfway through each oscillation. |
| Frequency<br>`frequency` | Integer | 1 | Min 1 | How many complete swings happen per locomotion loop. |

## Limitations

- Only the horizontal part of **Direction** is used, so it needs some X or Y.
- A swing can't use the root, pelvis or a foot target as its **Bone**, can't swing a bone around itself, and each bone can only be swung once.
- The pelvis only gets rotation keys when a rotation offset or bob value isn't zero.
- If a bone can't reach its generated transform the operator reports it, cancels, and puts the action, stash, pose and frame range back.

## Related Operators

- [Add Oscillatory Motion]({% link docs/all_the_tools/keyframing/add_oscillatory_motion.md %}): Layers oscillation onto an existing action instead.
- [Transfer Root Motion]({% link docs/all_the_tools/keyframing/transfer_root_motion.md %}): Moves travel from one bone to another in an existing action.
- [Redirect Root Motion]({% link docs/all_the_tools/keyframing/redirect_root_motion.md %}): Rotates generated or existing motion onto new directions.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
