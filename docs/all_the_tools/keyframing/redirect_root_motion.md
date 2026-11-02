---
title: Redirect Root Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 3
permalink: /all_the_tools/keyframing/redirect_root_motion/
---

# Redirect Root Motion

**Redirect Root Motion** (`mmt.redirect_motion`) rotates the active root bone's animation, and every independent control, around a world axis through the world origin. Any other selected bones get rotated back around the root to counter it. It's at `Pose > Apply > Redirect Root Motion` and in F3 Operator Search. It needs an active armature in Pose mode with an active pose bone on it, which is treated as the root, and NLA tweak mode off on the armature. An independent control is a parentless bone with no Child Of constraint.

The dialog lists the active action on its own, otherwise every action on the selected NLA tracks, otherwise one blank row to pick from. Each direction makes a redirected copy of the untouched source action, and a taken name gets a `.001` style suffix. A kept original gets stashed if the NLA isn't already holding it, and the redirected copies get stashed when **Stash Action** is on. When originals are kept and results are stashed, whatever was active stays active, otherwise the last redirected action becomes active. A report lists the new actions, along with any countered chains and controls.

Nothing is redirected until an angle is set. A blank list just finishes, and every direction at zero reports that an angle is needed. All directions need a name, and a zero angle on one direction while another is set is an error. An original can't be removed while another data-block is using it. Countering doesn't support a selected bone with more than one selected child, or a selected parentless bone that follows through a Child Of constraint. Redirecting clears the transforms of the selected bones and restores the rest of the pose. Failures report an error and cancel without leaving partial results.

- **Per Action > Action** (`action`) — Text; default empty. The action to redirect. One box per listed action.
- **Per Action > Directions** (`direction_count`) — Integer; default 1; min 1, max 64. How many redirected actions to make from this action, one per direction.
- **Direction > Axis** (`axis`) — Choice; default Z; options **X**, **Y**, **Z**. The world space axis to rotate the motion around. One row per Directions.
- **Direction > Angle** (`angle`) — Float, angle; default 0°; unbounded. How far to rotate the motion around the axis.
- **Direction > New Action** (`action_name`) — Text; default empty. The name of this new redirected action. (a taken name gets a .001 style suffix). New rows are named after the action.
- **Keep Original** (`keep_original`) — Checkbox; default On. Keep the original action as it is, otherwise it gets removed once the redirected action has been made.
- **Stash Action** (`stash_action`) — Checkbox; default On. Stash the redirected action in the NLA, named after the redirected action. Greyed out and forced on when there's more than one new action, or the actions came from the NLA.
