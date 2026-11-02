---
title: Add Oscillatory Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/keyframing/add_oscillatory_motion/
---

# Add Oscillatory Motion

**Add Oscillatory Motion** (`mmt.generate_loops`) layers looping world space location and rotation offsets, and local scale factors, onto the selected bones of the active action, in place. It's at `Pose > Apply > Add Oscillatory Motion` and in F3 Operator Search. It needs an active armature in Pose mode, at least one selected bone and an active action that isn't linked or read only. Move to the first frame you want generated before opening the dialog.

The offsets are added on top of what the action already does, from the current frame for `Loops × frames per base loop` frames. Generated keys are linear, and keys outside the generated range keep their handles. The action is marked as cyclic over the generated range, with Cycles modifiers on the keyed curves, and the scene frame range is set to it, leaving off the final key. Playback starts if the timeline isn't already playing. A report gives the bone count, frame count and frames per loop, and the actual speed when frame rounding changes it by more than 1%.

A bone with all location and rotation values at zero and all scale values at 1 isn't touched, and scale is only solved and keyed for bones that use it. Every frame is solved before any key is written, so if a bone can't reach its transform the operator reports it and cancels without changing the action. If the action's own motion doesn't match at the first and last generated frame, a warning says it won't loop cleanly, though the offsets themselves still do. Values already listed for a selected bone are kept the next time the dialog opens in the session.

- **Speed** (`speed`) — Float; default 1; min 0.001. How many base loops happen per second.
- **Frequency** (`frequency`) — Integer; default 1; min 1. How many complete oscillations happen per base loop.
- **Loops** (`loop_count`) — Integer; default 1; min 1. How many base loops to generate.
- **Bone > Min Location** (`minimum_location`) — Float x3, translation; default (0, 0, 0); unbounded. The world space X, Y and Z offset the loop starts and ends each oscillation at. One box per selected bone, in name order.
- **Bone > Max Location** (`maximum_location`) — Float x3, translation; default (0, 0, 0); unbounded. The world space X, Y and Z offset the loop reaches halfway through each oscillation.
- **Bone > Min Rotation** (`minimum_rotation`) — Float x3, euler; default (0°, 0°, 0°); unbounded. The world space X, Y and Z angles the loop starts and ends each oscillation at.
- **Bone > Max Rotation** (`maximum_rotation`) — Float x3, euler; default (0°, 0°, 0°); unbounded. The world space X, Y and Z angles the loop reaches halfway through each oscillation.
- **Bone > Min Scale** (`minimum_scale`) — Float x3, xyz; default (1, 1, 1); min 0.001. The local X, Y and Z scale factors the loop starts and ends each oscillation at. (multiplies the actions own scale, 1.0 changes nothing).
- **Bone > Max Scale** (`maximum_scale`) — Float x3, xyz; default (1, 1, 1); min 0.001. The local X, Y and Z scale factors the loop reaches halfway through each oscillation. (multiplies the actions own scale, 1.0 changes nothing).
- **Bone > Cycle Offset** (`cycle_offset`) — Float, factor; default 0; min 0, max 1. Shifts this bones oscillation along by a fraction of one oscillation.
