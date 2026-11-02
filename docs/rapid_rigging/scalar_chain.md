---
title: Scalar Chain
parent: Rapid Rigging
nav_order: 6
permalink: /rapid_rigging/scalar_chain/
---

# Scalar Chain

Rigs a chain of two or more bones with one stretchy IK target at its far end, and a pole you can scale and rotate to tweak the whole chain.

{% include media/youtube.html title="Adding a Scalar Chain: selecting a tail chain on the Oriented armature, adding the module, moving the IK target, scaling and rotating the pole to change chain tension, then snapping between IK and FK" %}

## Overview

Use this for a chain with no separate end bone, where the last bone's tail is where the target sits, such as a tail or a tentacle. The chain stretches to reach the target and keeps its original bone lengths at rest.

Each chain bone gets a forward bone plus inverse, offset and stretch mechanism bones. The controls are:

- **Parent** (`ikp_`): a copy of the first bone, carrying everything below.
- **IK target** (`ikt_`): at the last bone's tail, under the parent.
- **Vector** (`ikv_`): at the start, under the parent, aiming at the target.
- **Pole** (`pvt_`): under the vector. Scaling it changes the chain's tension and rotating it adds rotation along the chain.

The last forward bone doubles as the ending, and can have other modules attached.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select at least two bones of the chain.
3. Open `Pose > Add Rigging` and choose **Scalar Chain**.
4. Check **Offset** and **Position** in the Rigging Modules panel.

Two bones is the hard minimum and there's no maximum. There's no separate ending, every selected bone is in the chain.

Filled in for you, and not required: **Origin** from the first bone's parent, **Mirror Rigging**, **Position**, and **Axis** when the chain is straight.

Selection order doesn't matter, bones are read in the armature's own order.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values, along with **Axis**, **Offset** and **Floor Target**, are remembered for the next module of this type, in any file. Bones and mirroring aren't.

### Settings

- **Origin** (`suffices`) — Bone name; the first bone's parent. Optional. Where the chain attaches.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per selected bone. Required.
- **Axis** (`axis`) — Choice of Auto, +X, -X, +Z or -Z; default Auto. Picks a side of the first chain bone for the direction that controls sit in. A chosen axis always beats the bend of the chain. On Auto a bent chain uses its bend, and a straight chain gets an axis filled in when the module is added.
- **Offset** (`offset`) — Float; default 0.05. How far the pole sits from the chain. Negative puts it on the other side. It starts multiplied by the inverse of the scene's Unit Scale.
- **Position** (`position`) — Float; range 0 to 1. How far along the chain the pole sits. It's set when adding, to the middle joint closest to halfway, and isn't carried over from the last module.
- **Floor Target** (`floor`) — Checkbox; default off. Adds a floor bone at ground level below the target, adding **Floor Influence** to the controls.
- **Edit Shared** (`shared`) — Checkbox. On for the first module to claim a shared bone, off when another module already has it. On lets this module restyle that bone and off leaves it as it is.
- **Mirror Rigging** (`mirror`) — Checkbox; on when adding if every selected bone has an opposite side, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`. Builds the other side as its own list entry. An origin with no side in its name is shared by both. Settings stay matched and either side can be edited. With no opposite side it adds nothing. Turning it off removes the other side's bones.

### Naming

Prefixes added to bone names.

- **Target** — default `ikt_`. Prefix for the IK target. Required.
- **Parent** — default `ikp_`. Prefix for the control at the start of the chain. Required.
- **Pole** — default `pvt_`. Prefix for the pole target. Required.
- **Vector** — default `ikv_`. Prefix for the vector bone that aims at the IK target. Required.
- **Forward** — default empty. Prefix for the chain bones. Leave it empty, see Limitations.
- **Inverse** — default `ikc_`. Prefix for the inverse mechanism bones. Required.
- **Offset** — default `iko_`. Prefix for the offset mechanism bones. Required.
- **Stretch** — default `skc_`. Prefix for the stretch mechanism bones. Required.
- **Floor** — default `fvt_`. Prefix for the floor bone. Required. Only used once **Floor Target** is on.

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
- **Floor** — default 01 - Theme Color Set. Colors the floor bone. Only used once **Floor Target** is on.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Origin** — default Ring Half. Used by the origin bone.
- **Target** — default Ball Half. Used by the IK target.
- **Parent** — default Ring Half, scale 1.5. Used by the control at the start of the chain.
- **Pole** — default Ball Half. Used by the pole target.
- **Vector** — default Arrow Half. Used by the vector bone that aims at the IK target.
- **Forward** — default Ring Half, translation 0, 0.5, 0. Used by the chain bones.
- **Inverse** — default Ball Half, scale 0.5. Used by the inverse mechanism bones.
- **Offset** — default Ball Half, scale 0.3. Used by the offset mechanism bones.
- **Stretch** — default Dash Half. Used by the stretch mechanism bones.
- **Floor** — default Circle Half. Used by the floor bone. Only used once **Floor Target** is on.

## Controls

- **Floor Influence** — Only with **Floor Target** on. How strongly the floor holds the target.

Each chain bone has its own dropdown, **First Bone**, **Second Bone** and so on:

- **Rotation Influence** — How much of the IK result reaches this bone, so lowering it lets you pose the bone by hand.
- **Location Influence** — Off by default. Lets the bone move as well as rotate.
- **IK Stretch** — This bone's own stretch, spread gently up the chain by default.
- **X**, **Y** and **Z** rows — Each has this bone's IK lock, stiffness, limit toggle, minimum and maximum.

Press **Snap IK to FK** or **Snap FK to IK** to swap between the two without a pop. See [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %}).

## Limitations

- **Some Colors rows change nothing.** **Origin** takes its color from **Forward**, and **Parent**, **Pole** and **Vector** take theirs from **Target**. Use those rows instead.
- **A failed setup only reports to the system console.** With fewer than two bones selected, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **Offset compounds when Unit Scale isn't 1.** Each new module of this type multiplies the remembered value by the scene's scale again. At 0.01 three of this module in a row gave 5, 500 and 50,000. This matters most in Unreal scale scenes, so check **Offset** on each new module and set it by hand.
- **A Forward prefix breaks this module, so leave it empty.** Any prefix makes the rebuild fail partway with a `KeyError`, leaves the armature in Edit mode and stops later setting changes from rebuilding the module. Clearing it again doesn't recover the module. In testing, going back to Pose mode, clearing it and running Rebuild Rigging took this module from 21 bones to 25, with stale `zz_` bones left behind and the origin only under its prefixed name. Undo straight away if it happens, though that recovery couldn't be tested.
- **Axis is only filled in for the first module.** After that the last value is remembered for this type, even on a different chain, and a chosen axis always beats the chain's bend. In testing a saved -Z carried straight over, so check **Axis** on each new chain.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 21 bones to 0, and fixing it brought all 21 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Nothing checks that bones are connected.** A selection of unconnected bones built without complaint in testing, as `Scalar (head - tail_02)`, so check your selection.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Turning Mirror Rigging off leaves a dead entry.** The other side's bones go, 34 bones down to 17 in testing, but its entry stays in the list with settings and no bones. Select it and press **-**.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 21 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.
- There's no **Root** row on this module.

## Related

### Related Modules

- [Spline Chain]({% link docs/rapid_rigging/spline_chain.md %}): a chain shaped by several targets along a curve.
- [Curl Chain]({% link docs/rapid_rigging/curl_chain.md %}): a chain driven from one rotating control at its base.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})
- [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
