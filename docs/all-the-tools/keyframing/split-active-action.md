---
title: Split Active Action
parent: Keyframing
grand_parent: All The Tools
nav_order: 4
permalink: /all-the-tools/keyframing/split-active-action/
---

# Split Active Action

**Operator:** `mmt.split_action`  
**Label:** Split Active Action

Splits the active action into new actions by frame range, each one stashed on the armature.

## Location

- `Pose > Apply > Split Active Action`
- F3 Operator Search, which also works in Object mode

## Requirements

- An active armature in Object or Pose mode.
- An active action that isn't linked or read only, and has keyframes.
- NLA tweak mode off on the armature.

## Usage

1. Open the operator. The dialog starts with **Count** at 0.
2. Set **Count**. New rows spread evenly across the keyed range, or what's left of it after the last row.
3. Edit the name, start and end of each row.
4. Set **Keep Original**.
5. Confirm the dialog.

{% include media/screenshot.html alt="Split Active Action dialog in the 3D Viewport in Pose mode, with Count set to 3 and the name, start and end rows filled in." %}

## Result

- Each row makes one new action trimmed to its inclusive range and moved to start on frame 1, with its frame range set to match.
- Curves keep their shape at the cut points, and markers outside the range are removed.
- Each new action gets stashed in the NLA.
- With **Keep Original** off, the original is removed, which leaves no active action.

## Properties

### Dialog

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Count<br>`split_count` | Integer | 0 | Min 0, Max 64 | How many new actions to split the active action into. (nothing gets split at zero) |
| Keep Original<br>`keep_original` | Checkbox | On |  | Keep the original action as it is, otherwise it gets removed once every split has been made. |

### Split rows

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Name<br>`name` | Text | Empty |  | The name for this new action.<br>*One row per Count. New rows are named `<action>_01`, `<action>_02` and so on.* |
| Start<br>`start` | Integer | Dynamic | Unbounded | The first frame of this new action. (included)<br>*Filled in from the keyed range.* |
| End<br>`end` | Integer | Dynamic | Unbounded | The last frame of this new action. (included)<br>*Filled in from the keyed range.* |

## Limitations

- Nothing is split at **Count** 0. It reports that a count is needed.
- Ranges can overlap and don't need to cover the whole action.
- Each range has to sit inside the keyed range, with a name that's unique and not already an action. A split can only take the original's name when **Keep Original** is off.
- An original can't be removed while another data-block is using it.
- Failures report an error and put everything back.

## Related Operators

- [Transfer Root Motion]({% link docs/all-the-tools/keyframing/transfer-root-motion.md %}): Takes the resulting NLA tracks as its action list.
- [Redirect Root Motion]({% link docs/all-the-tools/keyframing/redirect-root-motion.md %}): Takes the resulting NLA tracks as its action list.
- [Export Mr Mannequins FBX]({% link docs/all-the-tools/exporting/export-mr-mannequins-fbx.md %}): Exports stashed actions by default.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
