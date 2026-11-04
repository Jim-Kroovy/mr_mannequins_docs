---
title: Split Active Action
parent: Keyframing
grand_parent: All The Tools
nav_order: 4
permalink: /all_the_tools/keyframing/split_active_action/
---

# Split Active Action

**Split Active Action** (`mmt.split_action`) splits the active action into new actions by frame range, each one stashed on the armature. It's at `Pose > Apply > Split Active Action` and in F3 Operator Search, which also works in Object mode. It needs an active armature in Object or Pose mode, NLA tweak mode off on it, and an active action that has keyframes and isn't linked or read only.

{% include media/youtube.html title="Splitting a long action with Split Active Action: setting Count, adjusting each row's name and frame range and checking the new stashed actions" %}

The dialog starts with **Count** at 0. New rows spread evenly across the keyed range, or what's left of it after the last row. Each row makes one new action trimmed to its inclusive range and moved to start on frame 1, with its frame range set to match. Curves keep their shape at the cut points, and markers outside the range are removed. With **Keep Original** off, the original is removed, which leaves no active action.

Nothing is split at **Count** 0, and it reports that a count is needed. Ranges can overlap and don't need to cover the whole action. Each range has to sit inside the keyed range, with a name that's unique and not already an action, and a split can only take the original's name when **Keep Original** is off. An original can't be removed while another data-block is using it. Failures report an error and put everything back.

- **Count** (`split_count`) — Integer; default 0; min 0, max 64. How many new actions to split the active action into. (nothing gets split at zero).
- **Keep Original** (`keep_original`) — Checkbox; default On. Keep the original action as it is, otherwise it gets removed once every split has been made.
- **Split > Name** (`name`) — Text; default empty. The name for this new action. One row per Count. New rows are named `<action>_01`, `<action>_02` and so on.
- **Split > Start** (`start`) — Integer; default dynamic; unbounded. The first frame of this new action. (included). Filled in from the keyed range.
- **Split > End** (`end`) — Integer; default dynamic; unbounded. The last frame of this new action. (included). Filled in from the keyed range.
