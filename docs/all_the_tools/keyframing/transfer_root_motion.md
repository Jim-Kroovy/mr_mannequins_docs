---
title: Transfer Root Motion
parent: Keyframing
grand_parent: All The Tools
nav_order: 5
permalink: /all_the_tools/keyframing/transfer_root_motion/
---

# Transfer Root Motion

**Transfer Root Motion** (`mmt.transfer_motion`) transfers the source bone's travel along a world direction onto the target bone (eg. root motion) in every listed action, keying location only. It's at `Pose > Apply > Transfer Root Motion` and in F3 Operator Search. It needs an active armature in Pose mode and NLA tweak mode off on it. Select the source bone, then make the target bone active, so they fill in **Source** and **Target**. The dialog lists the active action on its own, otherwise every action on the selected NLA tracks, otherwise one blank row to pick from.

{% include media/youtube.html title="Transferring root motion: selecting the pelvis, making the root bone active, listing the actions and checking the root's travel after the transfer" %}

In each listed action, the source's travel along that direction moves to the target, keyed on every whole frame inside the action's frame range. The actions are edited in place, and only the location curves of the two bones change. The previously active action, pose and frame are restored, and a report lists the actions and the frame count.

Blank rows are skipped, and anything unfinished or invalid quietly does nothing and leaves the redo panel up, with no pop-ups. It's all or nothing: if any listed action fails, every action goes back as it was. An action fails when it's linked or read only, listed twice, has a zero direction, has no whole frame to sample, or has no slot that animates the armature. The transfer fails if a bone's location can't fully drive it at some frame, so check its constraints and scale. A source that follows the target already carries the target's travel, so only what's left gets transferred.

- **Source** (`source_bone`) — Text; default from selection. The bone whose directional travel gets moved onto the target. (eg. the pelvis). Filled in when the dialog opens: the first selected bone that isn't active.
- **Target** (`target_bone`) — Text; default from selection. The bone that receives the directional travel. (eg. the root). Filled in when the dialog opens: the active bone.
- **Per Action > Action** (`action`) — Text; default empty. The action to transfer motion in. One box per listed action.
- **Per Action > Direction** (`direction`) — Float x3, xyz; default (0, 1, 0); unbounded. The world space direction of travel to transfer for this action.
