---
title: Retarget
parent: Retargeting
grand_parent: All The Tools
nav_order: 4
permalink: /all_the_tools/retargeting/retarget/
---

# Retarget

**Retarget** (`mmt.actions`) retargets actions between the active armature and another one, in either direction. It's at `Pose > Apply` as **Retarget Actions To** and **Retarget Actions From**, and in F3 Operator Search, which uses the From direction. It needs an active armature. Nothing happens until you pick a **Target** in the redo panel.

The source armature's active action and its stashed actions are each retargeted onto the receiving armature. The new action from the source's active action is made active on the receiver, and the rest are stashed. If the source had no active action, or it failed, the receiver's active action is cleared and its pose reset. An action with no bones matching the receiver is skipped. With **Keep Original** on, new actions are prefixed with the receiving armature's Original name. **Warning:** with it off, the source actions and their stash entries are deleted, and the new actions take their names. The active armature and its mode are restored, and anything hidden goes back to hidden.

The active armature's side uses the highest tier in its hierarchy, whichever tier is active. **Target** lists each other character at its highest tier, plus the active armature's own Oriented when it isn't the active object. A receiver with a Rigging armature gets its result baked through its rigging, and that's where **Step Height** matters. **Only Selected** looks at bone selection on the receiving armature. Each bone uses its own Rotation and Translation retargeting settings from the Retargeting panel.

- **Direction** (`direction`) — Choice; default From. Which way actions retarget between the active armature and the target. Hidden. Set by the menu entry.
  - **From** (`FROM`): Pull actions from the target onto the active armature. This is **Retarget Actions From**.
  - **To** (`TO`): Push actions from the active armature onto the target. This is **Retarget Actions To**.
- **Target** (`target`) — Choice; default None, reset every time; dynamic list. Armature to retarget actions with.
- **Only Selected** (`only_selected`) — Checkbox; default Off. Only retarget bones that are currently selected, leaving unselected bones untouched.
- **Keep Original** (`keep_original`) — Checkbox; default On. Keep the source actions, prefixing the new ones with the receiving armatures name. Disable to remove the source actions instead, renaming the new ones onto their old names.
- **Step Height** (`step_height`) — Float; default 0.1; min 0. How far a plantigrade foot's heel needs to lift before its parent fully hands the ball's own hinge rotation over to the foot control, rather than carrying it directly.
