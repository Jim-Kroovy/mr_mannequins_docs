---
title: Spline Chain
parent: Rapid Rigging
nav_order: 2
permalink: /rapid_rigging/spline_chain/
---

# Spline Chain

Rigs a chain of three or more bones along a curve, with a row of targets that shape it. It suits spines and anything else that should bend smoothly along its length.

{% include media/youtube.html title="Adding a Spline Chain: selecting four spine bones on the Oriented armature, adding the module, moving the spline targets to bend the chain, changing Count and Influences, then snapping between IK and FK" %}

## Overview

Each chain bone gets a forward bone you can pose by hand, plus stretch and offset mechanism bones. Target bones hook onto a NURBS curve, and the stretch bones follow it through a Spline IK constraint, so moving a target bends the chain. Rotating the parent control twists the whole spline, and targets' rotation feeds each bone's twist.

The curve is a separate object named `<armature> (<first> - <last>)`, parented to the parent control. Removing the module removes it too. Forward bones are resized to an even share of the chain's length, rather than keeping their own.

The first and last forward bones can have other modules attached, and the bone in the **Origin** row carries the whole module through a constraint on the parent control.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select at least three bones of the chain.
3. Open `Pose > Add Rigging` and choose **Spline Chain**.
4. Check **Count** and **Offset** in the Rigging Modules panel.

There's no separate ending bone, every selected bone is in the chain. Three is the hard minimum and there's no maximum.

The first bone's parent fills in **Origin**, which is optional. **Mirror Rigging** and **Axis** are filled in for you too.

Selection order doesn't matter, bones are read in the armature's own order.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values, along with **Axis**, **Offset**, **Count** and **Influences**, are remembered for the next module of this type, in any file. Bones and mirroring aren't.

### Settings

- **Origin** (`suffices`) — Bone name; the first bone's parent. Optional. The bone this module follows.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per selected bone. Required.
- **Axis** (`axis`) — Choice of Auto, +X, -X, +Z or -Z; default Auto. Picks the direction this module's custom shapes are oriented from, and doesn't move any bones. A chosen axis always beats the bend of the chain. On Auto a bent chain uses its bend, and a straight chain gets an axis filled in when the module is added.
- **Offset** (`offset`) — Float; default -0.3. Sets the target bones' length and which way they point, and the parent control's length. It starts multiplied by the inverse of the scene's Unit Scale.
- **Count** (`count`) — Integer; default 3, minimum 2. How many targets to spread along the chain.
- **Influences** (`influences`) — Integer; default 2, range 1 to 38. How many nearby targets blend together to drive each bone's twist.
- **Edit Shared** (`shared`) — Checkbox. On for the first module to claim a shared bone, off when another module already has it. On lets this module restyle that bone and off leaves it as it is.
- **Mirror Rigging** (`mirror`) — Checkbox; on when adding if every selected bone has an opposite side, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`. Builds the other side as its own list entry. An origin with no side in its name is shared by both. Settings stay matched and either side can be edited. With no opposite side it adds nothing. Turning it off removes the other side's bones.

### Naming

Prefixes added to bone names.

- **Target** — default `ikt_`. Prefix for the spline targets. Required.
- **Parent** — default `ikp_`. Prefix for the control all the targets sit under. Required.
- **Vector** — default `ikv_`. Required, but inactive. See Limitations.
- **Forward** — default empty. Prefix for the chain bones. Leave it empty, see Limitations.
- **Stretch** — default `skc_`. Prefix for the stretch mechanism bones. Required.
- **Offset** — default `iko_`. Prefix for the offset mechanism bones. Required.

### Colors

- **Origin** — default 13 - Theme Color Set. Inactive, see Limitations.
- **Target** — default 01 - Theme Color Set. Colors the spline targets. Also colors every other control in this module.
- **Parent** — default 01 - Theme Color Set. Inactive, see Limitations.
- **Forward** — default 13 - Theme Color Set. Colors the chain bones. Also colors the origin and ending.
- **Stretch** — default 10 - Theme Color Set. Colors the stretch mechanism bones.
- **Offset** — default 10 - Theme Color Set. Colors the offset mechanism bones.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Origin** — default Ring Half. Used by the origin bone.
- **Target** — default Strips Single, scale 2, 2, 2.5. Used by the spline targets.
- **Parent** — default Ring Half, scale 3. Used by the control all the targets sit under.
- **Forward** — default Strips Single, scale 4, 3, 2, translation 0, 0.5, -1. Used by the chain bones.
- **Stretch** — default Dash Half. Used by the stretch mechanism bones.
- **Offset** — default Ball Half, scale 0.5. Used by the offset mechanism bones.

## Controls

Each chain bone has its own dropdown, **First Bone**, **Second Bone** and so on:

- **Rotation Influence** — How much of the spline's result reaches this bone, so lowering it lets you pose the bone by hand.
- **Location Influence** — Off by default. Lets the bone move as well as rotate.
- **First Influence**, **Second Influence** and so on — How much each target's twist reaches this bone. **Influences** sets the starting values, and you can raise any of them to pull the bone toward another target.

Press **Snap IK to FK** or **Snap FK to IK** to swap between the two without a pop. See [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %}).

## Limitations

- **Some Colors rows change nothing.** **Origin** takes its color from **Forward**, and **Parent** takes its color from **Target**. Use those rows instead.
- **A failed setup only reports to the system console.** With fewer than three bones selected, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **Offset compounds when Unit Scale isn't 1.** Each new module of this type multiplies the remembered value by the scene's scale again. At 0.01 three of this module in a row gave -30, -3,000 and -300,000. This matters most in Unreal scale scenes, so check **Offset** on each new module and set it by hand.
- **A Forward prefix breaks this module, so leave it empty.** Any prefix makes the rebuild fail partway with a `KeyError`, leaves the armature in Edit mode and stops later setting changes from rebuilding the module. Clearing it again doesn't recover the module. In testing, going back to Pose mode, clearing it and running Rebuild Rigging took this module from 17 bones to 24, with stale `zz_` bones left behind and the origin only under its prefixed name. Undo straight away if it happens, though that recovery couldn't be tested.
- **Count can make more targets than you asked for.** Its description says it can't exceed the chain length, but nothing stops it, and targets landing exactly on a joint get doubled. On a four bone chain in testing, 2 gave two targets, 3 gave three, 4 gave six, 5 gave five and 9 gave six, so check the target count after changing it.
- **The Vector row in Naming is unused but still required.** This module has no vector bone, but blanking the row removes all 17 bones until you fill it in again.
- Forward bones don't keep their original lengths.
- **Axis is only filled in for the first module.** After that the last value is remembered for this type, even on a different chain, and a chosen axis always beats the chain's bend. In testing a saved -Z carried straight over, so check **Axis** on each new chain.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 17 bones to 0, and fixing it brought all 17 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Nothing checks that bones are connected.** A selection of unconnected bones built without complaint in testing, as `Spline (head - tail_02)`, so check your selection.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Turning Mirror Rigging off leaves a dead entry.** The other side's bones go, 28 bones down to 14 in testing, but its entry stays in the list with settings and no bones. Select it and press **-**.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 17 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.

## Related

### Related Modules

- [Curl Chain]({% link docs/rapid_rigging/curl_chain.md %}): a chain driven from one control, which is what the head and neck use in the biped setup.
- [Scalar Chain]({% link docs/rapid_rigging/scalar_chain.md %}): a chain driven by one IK target.
- [Root Controls]({% link docs/rapid_rigging/root_controls.md %})

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})
- [Snap IK to FK]({% link docs/all_the_tools/rigging/snap_ik_to_fk.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
