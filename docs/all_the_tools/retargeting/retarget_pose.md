---
title: Retarget Pose
parent: Retargeting
grand_parent: All The Tools
nav_order: 5
permalink: /all_the_tools/retargeting/retarget_pose/
---

# Retarget Pose

**Retarget Pose** (`mmt.pose`) sets or applies a retarget pose. Set poses the active armature into a target's bone directions only, without touching names, meshes or actions, so it can be cleaned up by hand. Apply then bakes that pose onto the meshes and rest pose, carrying stashed actions along. It's at `Pose > Apply` as **Set Retarget Pose** and **Apply Retarget Pose**, and in F3 Operator Search, which uses the Set mode. It needs an active armature that isn't tagged Rigging, and is greyed out with "Requires an Original or Oriented armature, not Rigging" otherwise.

{% include media/youtube.html title="Setting a retarget pose against a Target, cleaning it up by hand, then running Apply Retarget Pose to bake it into the meshes and rest pose" %}

**Set** leaves the armature posed into the target's bone directions, in Pose mode. With **Only Selected**, unselected bones follow whatever their posed parent gives them. **Apply** bakes the current pose into the meshes and makes it the original's rest pose, clears its constraints, and gives its bones the target's orientation while keeping their own lengths. An existing Oriented armature is replaced by a rebuilt one with the same name, and its actions are carried across. Without an Oriented armature, only the Original gets applied, and building one is left to [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}). Socket meshes get converted to skeletal, and anything hidden goes back to hidden.

**Target** lists each other character at its Oriented tier, or its Original if it has no Oriented. Whatever's picked resolves to that character's Oriented, or its Original, and nothing happens when that's the active armature itself. Everything else gets deselected before it runs, so other armatures don't get pulled into Pose mode. **Warning:** Apply changes rest poses and bakes meshes, and no branch of Apply rebuilds an existing Rigging armature above the pair.

- **Mode** (`mode`) — Choice; default Set. Whether we're setting a new retarget pose, or applying the one already set. Hidden. Set by the menu entry.
  - **Set** (`SET`): This is **Set Retarget Pose**. Each run from the menu resets **Target** to None, and nothing happens until one is picked.
  - **Apply** (`APPLY`): This is **Apply Retarget Pose**. It keeps the last target so it isn't picked twice.
- **Target** (`target`) — Choice; default None for Set, last used for Apply; dynamic list. Armature to pose (or retarget) the active armature against.
- **Only Selected** (`only_selected`) — Checkbox; default Off. Only pose bones that are currently selected, leaving unselected bones untouched. Set mode only.
- **Max Length** (`max_length`) — Float; default 0; min 0. Clamp retargeted armature bones down to this length after positioning them. Apply mode only. 0 turns clamping off.
- **Rename Bones** (`rename`) — Checkbox; default On. Rename bones onto the targets own naming wherever a bone mapping resolves one, so this armature fully matches the target - names, orientations and retargeting settings alike. Disable to keep this armatures own names, eg. to reuse them in a different pose. Apply mode only.
- **Enforce Hierarchy** (`enforce_hierarchy`) — Checkbox; default On. Pad any chain the target has more bones in than this armature does, so both skeletons keep the same joint count - injected bones are positioned proportionally to this armatures own real bone gap, but oriented like their own target counterpart, and the transported animation is split evenly across them rather than left concentrated on the one bone that used to carry all of it. Apply mode only.
