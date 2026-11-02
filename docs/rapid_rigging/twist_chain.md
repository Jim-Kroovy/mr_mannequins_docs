---
title: Twist Chain
parent: Rapid Rigging
nav_order: 8
permalink: /rapid_rigging/twist_chain/
---

# Twist Chain

Makes one or more twist bones take a share of the twist of a target bone, so a forearm or thigh can twist evenly along its length.

{% include media/youtube.html title="Adding a Twist Chain: selecting a forearm twist bone and making the hand active on the Oriented armature, adding the module with mirroring on, rotating the hand, then changing Rotation Influence and Inverse" %}

## Overview

Use this for helper bones that exist for skinning, like forearm and upper arm twists. They're usually the last thing added, because they read their twist from bones other modules rig.

A pole bone sits on the target, carrying the target's twist, and a vector bone follows it with a Locked Track, so its Y rotation is the twist alone. Each twist bone copies that rotation. How much depends on how far along the span from **Origin** to **Ending** the bone sits, so bones further along get more.

Twist bones are parented to the origin. They don't take part in anything else, and there's nothing here to pose by hand.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select the twist bones.
3. Shift select the bone they read from, so it's active. That's the **Target**, such as the hand or the upper arm.
4. Open `Pose > Add Rigging` and choose **Twist Chain**.
5. Check **Origin**, **Ending** and **Inverse** in the Rigging Modules panel.

An active bone plus at least one other selected bone is the hard minimum. There's no maximum, and the twist bones are sorted by their distance from the origin.

The rest is worked out from where the twist bones sit, so change anything it got wrong:

- **Twist bones under the target's parent**, such as a forearm twist with the hand as target: **Origin** is the target's parent, **Ending** is the target and **Inverse** is off.
- **Twist bones under the target**, such as an upper arm twist with the upper arm as target: **Origin** is the target itself, **Ending** is its furthest child and **Inverse** is on.
- **Neither**: it goes by which of the target or its parent is closer to the nearest twist bone.

A target with no parent uses itself as the origin. Selection order doesn't matter, bones are read in the armature's own order.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values, along with **Axis** and **Offset**, are remembered for the next module of this type, in any file. **Inverse** is worked out again each time. Bones and mirroring aren't remembered.

### Settings

- **Origin** (`suffices`) — Bone name; worked out when adding. The start of the span, and what twist bones are parented to.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per twist bone. Required.
- **Target** (`suffices`) — Bone name; the active bone. Required. It can be shared with other twist chains.
- **Ending** (`suffices`) — Bone name; worked out when adding. The far end of the span.
- **Axis** (`axis`) — Choice of Auto, +X, -X, +Z or -Z; default Auto. Which side of the target the pole sits on. Auto picks whichever points furthest from the world origin.
- **Offset** (`offset`) — Float; default 0.1. How far the pole sits from the target. It starts multiplied by the inverse of the scene's Unit Scale.
- **Inverse** (`inverse`) — Checkbox; on when the target is its own origin. Reverses the spread of influence along the chain, and inverts the twist.
- **Edit Shared** (`shared`) — Checkbox. On for the first module to claim a shared bone, off when another module already has it. On lets this module restyle that bone and off leaves it as it is.
- **Mirror Rigging** (`mirror`) — Checkbox; on when adding if every selected bone has an opposite side, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`. Builds the other side as its own list entry. An origin with no side in its name is shared by both. Settings stay matched and either side can be edited. With no opposite side it adds nothing. Turning it off removes the other side's bones.

### Naming

Prefixes added to bone names. **Forward** can take a prefix on this module.

- **Pole** — default `tvt_`. Prefix for the pole bone on the target. Required.
- **Forward** — default empty. Prefix for the twist bones.
- **Vector** — default `tkv_`. Prefix for the vector bone that reads the twist. Required.

### Colors

- **Origin** — default 13 - Theme Color Set. Inactive, see Limitations.
- **Pole** — default 04 - Theme Color Set. Colors the pole bone on the target.
- **Forward** — default 13 - Theme Color Set. Colors the twist bones. Also colors the origin, target and any parent bone it adds.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Origin** — default Ring Half. Used by the origin bone.
- **Pole** — default Ball Half. Used by the pole bone on the target.
- **Forward** — default Bicone Half. Used by the twist bones.
- **Vector** — default Arrow Half, scale 0.5. Used by the vector bone that reads the twist.

## Controls

Each twist bone has its own dropdown, **First**, **Second** and so on:

- **Rotation Influence** — How much of the twist reaches this bone. It starts at the value worked out from the bone's position, and rebuilding puts it back there.

## Limitations

- **Some Colors rows change nothing.** **Origin** takes its color from **Forward**. Use those rows instead.
- **A failed setup only reports to the system console.** Without an active bone and another selected bone, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **Offset compounds when Unit Scale isn't 1.** Each new module of this type multiplies the remembered value by the scene's scale again. At 0.01 three of this module in a row gave 10, 1,000 and 100,000. This matters most in Unreal scale scenes, so check **Offset** on each new module and set it by hand.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 5 bones to 0, and fixing it brought all 5 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Turning Mirror Rigging off leaves a dead entry.** The other side's bones go, 10 bones down to 5 in testing, but its entry stays in the list with settings and no bones. Select it and press **-**.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 5 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.
- There's no snapping, and nothing here to animate directly.
- Change the bones it found if your hierarchy isn't one of the setups above, because the guess can be wrong.

## Related

### Related Modules

- [Opposable Arm]({% link docs/rapid_rigging/opposable_arm.md %}) and [Plantigrade Leg]({% link docs/rapid_rigging/plantigrade_leg.md %}): the limbs twist bones usually sit on.
- [Custom Bones]({% link docs/rapid_rigging/custom_bones.md %}): for plain bones with no twist.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
