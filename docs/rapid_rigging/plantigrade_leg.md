---
title: Plantigrade Leg
parent: Rapid Rigging
nav_order: 4
permalink: /rapid_rigging/plantigrade_leg/
---

# Plantigrade Leg

Rigs a leg that walks on the whole foot, with IK, a pole, a foot roll around the ball, and a floor. This is the human style of leg.

{% include media/youtube.html title="Adding a Plantigrade Leg: selecting the thigh, calf and foot on the Oriented armature, adding the module with mirroring on, checking Pivot, then moving the foot parent, rolling the foot with its control and snapping between IK and FK" %}

## Overview

Use this for heel to toe walkers, where the foot is flat on the ground and rolls over the ball. For animals that stand on their toes with an extra leg segment, use [Digitigrade Leg]({% link docs/rapid_rigging/digitigrade_leg.md %}).

Each chain bone gets a forward bone plus inverse, offset and stretch mechanism bones. The foot and ball get forward and inverse bones too, and the ball's forward bone and the foot's can have other modules attached.

The controls are:

- **Foot parent** (`ikp_`): sits on the ground and moves the whole foot. It has no parent, and the floor limits it when **Floor Target** is on.
- **Foot control** (`ckt_`): at the ankle, under the foot parent. Its rotation drives the two rotator bones, which roll the foot around the ball.
- **IK target** (`ikt_`): at the ankle, under the rotators.
- **Pole** (`pvt_`) and **vector** (`ikv_`): the pole sits at the knee and follows the vector bone, which aims at the IK target.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select at least the thigh, calf and foot.
3. Open `Pose > Add Rigging` and choose **Plantigrade Leg**.
4. Check **Pivot** in the Rigging Modules panel, then **Offset** and **Position**.

Three bones is the hard minimum and there's no maximum. The last selected bone is always the **Ending**, and the rest are the chain.

**Pivot** is required and comes from the foot's first child, commonly a ball or toe bone. If it picked the wrong child, set the right bone here. The ball itself isn't part of your selection.

Filled in for you, and not required: **Origin** from the first bone's parent, **Mirror Rigging**, **Position**, and **Axis** when the chain is straight. The **Root** row starts empty.

Selection order doesn't matter, bones are read in the armature's own order.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values, along with **Axis**, **Offset** and **Floor Target**, are remembered for the next module of this type, in any file. Bones and mirroring aren't.

### Settings

- **Origin** (`suffices`) — Bone name; the first bone's parent. Optional. Where the chain attaches.
- **Root** (`suffices`) — Bone name; empty. Optional. A bone that carries the foot parent, pole and floor, adding **Root Influence** to the controls. It's copied as a bone of its own if nothing has rigged it.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per chain bone. Required.
- **Ending** (`suffices`) — Bone name; the last selected bone. Required. The foot.
- **Pivot** (`suffices`) — Bone name; the foot's first child. Required. The ball the foot rolls over.
- **Axis** (`axis`) — Choice of Auto, +X, -X, +Z or -Z; default Auto. Picks a side of the first chain bone for the direction that controls sit in. A chosen axis always beats the bend of the chain. On Auto a bent chain uses its bend, and a straight chain gets an axis filled in when the module is added.
- **Offset** (`offset`) — Float; default 0.3. How far the pole sits from the chain. Negative puts it on the other side. It starts multiplied by the inverse of the scene's Unit Scale.
- **Position** (`position`) — Float; range 0 to 1. How far along the chain the pole sits. It's set when adding, to the middle joint closest to halfway, and isn't carried over from the last module.
- **Floor Target** (`floor`) — Checkbox; default on. Adds a floor bone at ground level under the foot, adding **Floor Influence** to the controls.
- **Edit Shared** (`shared`) — Checkbox. On for the first module to claim a shared bone, off when another module already has it. On lets this module restyle that bone and off leaves it as it is.
- **Mirror Rigging** (`mirror`) — Checkbox; on when adding if every selected bone has an opposite side, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`. Builds the other side as its own list entry. An origin with no side in its name is shared by both. Settings stay matched and either side can be edited. With no opposite side it adds nothing. Turning it off removes the other side's bones.

### Naming

Prefixes added to bone names.

- **Target** — default `ikt_`. Prefix for the IK target. Required.
- **Parent** — default `ikp_`. Prefix for the control above the IK target. Required.
- **Pole** — default `pvt_`. Prefix for the pole target. Required.
- **Vector** — default `ikv_`. Prefix for the vector bone that aims at the IK target. Required.
- **Forward** — default empty. Prefix for the chain bones. Leave it empty, see Limitations.
- **Inverse** — default `ikc_`. Prefix for the inverse mechanism bones. Required.
- **Offset** — default `iko_`. Prefix for the offset mechanism bones. Required.
- **Stretch** — default `skc_`. Prefix for the stretch mechanism bones. Required.
- **Rotator** — default `rkt_`. Prefix for the ball and foot rotator bones. Required.
- **Control** — default `ckt_`. Prefix for the foot control. Required.
- **Floor** — default `fvt_`. Prefix for the floor bone. Required.
- **Root** — default empty. Prefix for the bone picked in the **Root** row. Only used once the **Root** row has a bone.

### Colors

- **Origin** — default 13 - Theme Color Set. Inactive, see Limitations.
- **Target** — default 01 - Theme Color Set. Colors the IK target. Also colors every other control in this module.
- **Parent** — default 01 - Theme Color Set. Inactive, see Limitations.
- **Pole** — default 01 - Theme Color Set. Inactive, see Limitations.
- **Vector** — default 01 - Theme Color Set. Inactive, see Limitations.
- **Forward** — default 13 - Theme Color Set. Colors the chain bones. Also colors the origin and ending.
- **Inverse** — default 10 - Theme Color Set. Colors the inverse mechanism bones.
- **Offset** — default 10 - Theme Color Set. Colors the offset mechanism bones.
- **Stretch** — default 10 - Theme Color Set. Colors the stretch mechanism bones.
- **Control** — default Default Colors. Inactive, see Limitations.
- **Floor** — default 01 - Theme Color Set. Inactive, see Limitations.
- **Root** — default 01 - Theme Color Set. Colors the bone picked in the **Root** row. Only used once the **Root** row has a bone.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Origin** — default Ring Half. Used by the origin bone.
- **Target** — default Ball Half, scale 2. Used by the IK target.
- **Parent** — default Squing Half, scale 4, 2, 2. Used by the control above the IK target.
- **Pole** — default Ball Half. Used by the pole target.
- **Vector** — default Arrow Half. Used by the vector bone that aims at the IK target.
- **Forward** — default Ring Half, translation 0, 0.2, 0. Used by the chain bones.
- **Inverse** — default Ball Half, scale 0.5. Used by the inverse mechanism bones.
- **Offset** — default Ball Half, scale 0.3. Used by the offset mechanism bones.
- **Stretch** — default Dash Half. Used by the stretch mechanism bones.
- **Ending** — default Ring Half, scale 3, translation 0, -0.5, 0. Used by the ending bone.
- **Pivot** — default Ring Quarter, scale 3. Used by the ball bone.
- **Rotator** — default Ball Quarter, scale 0.5. Used by the ball and foot rotator bones.
- **Control** — default Strips Quarter, scale 2. Used by the foot control.
- **Floor** — default Circle Half, scale 1.5. Used by the floor bone.
- **Root** — default Circle Full. Used by the bone picked in the **Root** row. Only used once the **Root** row has a bone.

## Controls

- **Pivot Influence** — On by default. How much the foot roll rotates the ball.
- **Vector Influence** — On by default. How much the pole follows the vector bone, so turning it down leaves the pole free.
- **Root Influence** — Only with a bone in the **Root** row. How much the foot parent and pole follow it.
- **Floor Influence** — Only with **Floor Target** on. How strongly the floor holds the foot parent.

Each chain bone has its own dropdown, **First Bone**, **Second Bone** and so on:

- **Rotation Influence** — How much of the IK result reaches this bone, so lowering it lets you pose the bone by hand.
- **Location Influence** — Off by default. Lets the bone move as well as rotate.
- **IK Stretch** — This bone's own stretch, spread gently up the chain by default.
- **X**, **Y** and **Z** rows — Each has this bone's IK lock, stiffness, limit toggle, minimum and maximum.

**End Bone** has **Rotation Influence** and **Location Influence** for the foot.

Press **Snap IK to FK** or **Snap FK to IK** to swap between the two without a pop. See [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %}).

## Limitations

- **Some Colors rows change nothing.** **Origin** takes its color from **Forward**, and **Parent**, **Pole**, **Vector**, **Control** and **Floor** take theirs from **Target**. Use those rows instead. **Control** also starts on Default Colors rather than a theme color like the others.
- **A failed setup only reports to the system console.** With fewer than three bones selected, or a foot with no child for **Pivot**, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **Offset compounds when Unit Scale isn't 1.** Each new module of this type multiplies the remembered value by the scene's scale again. At 0.01 three of this module in a row gave 30, 3,000 and 300,000. This matters most in Unreal scale scenes, so check **Offset** on each new module and set it by hand.
- **A Forward prefix breaks this module, so leave it empty.** Any prefix makes the rebuild fail partway with a `KeyError`, leaves the armature in Edit mode and stops later setting changes from rebuilding the module. Clearing it again doesn't recover the module. In testing, going back to Pose mode, clearing it and running Rebuild Rigging took this module from 22 bones to 24, with stale `zz_` bones left behind and the origin only under its prefixed name. Undo straight away if it happens, though that recovery couldn't be tested.
- **Axis is only filled in for the first module.** After that the last value is remembered for this type, even on a different chain, and a chosen axis always beats the chain's bend. In testing a saved -Z carried straight over, so check **Axis** on each new chain.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 22 bones to 0, and fixing it brought all 22 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Nothing checks that bones are connected.** A selection of unconnected bones built without complaint in testing, as `Plantigrade (tail_01 - foot_l)`, so check your selection.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Turning Mirror Rigging off leaves a dead entry.** The other side's bones go, 43 bones down to 22 in testing, but its entry stays in the list with settings and no bones. Select it and press **-**.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 22 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.
- The ground is the armature's Z 0, so the floor bone and the foot parent sit there whatever height the character stands at.

## Related

### Related Modules

- [Digitigrade Leg]({% link docs/rapid_rigging/digitigrade_leg.md %}): legs that stand on the toes.
- [Opposable Arm]({% link docs/rapid_rigging/opposable_arm.md %}): the same setup without the foot roll.
- [Twist Chain]({% link docs/rapid_rigging/twist_chain.md %}): thigh twist bones.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})
- [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
