---
title: Curl Chain
parent: Rapid Rigging
nav_order: 7
permalink: /rapid_rigging/curl_chain/
---

# Curl Chain

Rigs a chain of two or more bones so a single control curls all of them at once. This suits fingers, and short chains like a neck and head.

{% include media/youtube.html title="Adding a Curl Chain: selecting three finger bones on the Oriented armature, adding the module with mirroring on, rotating the curl control, then turning off curl axes per bone in Settings and Controls" %}

## Overview

Rotating or scaling the control passes that to every bone in the chain, and moving it repositions the chain. Each chain bone also has its own forward bone you can pose on top of the curl. Mechanism stretch and offset bones sit underneath.

The control (`ckt_`) is a copy of the first bone, parented to the origin. Forward bones are resized to an even share of the chain's length, and point along their own axis closest to the next bone.

The last forward bone can have other modules attached. There's no IK here, so no snapping either.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select at least two bones of the chain.
3. Open `Pose > Add Rigging` and choose **Curl Chain**.

Two bones is the hard minimum and there's no maximum. Every selected bone is in the chain, and each finger needs its own module.

Filled in for you, and not required: **Origin** from the first bone's parent, **Mirror Rigging**, and **Axis** when the chain is straight.

Selection order doesn't matter, bones are read in the armature's own order.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values, along with **Axis**, **Offset** and the axis toggles, are remembered for the next module of this type, in any file. Bones and mirroring aren't.

### Settings

- **Origin** (`suffices`) — Bone name; the first bone's parent. Optional. What the control is parented to.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per selected bone. Required. Each row has **X**, **Y** and **Z** toggles, all on by default, for which axes of the control's rotation reach that bone.
- **Axis** (`axis`) — Choice of Auto, +X, -X, +Z or -Z; default Auto. Picks the direction this module's custom shapes are oriented from, and doesn't move any bones. A straight chain gets an axis filled in when the module is added.
- **Offset** (`offset`) — Float; default 0. Only affects shapes here, not bones. Negative flips the shapes on the chain and control, and the size of it scales up the forward and control shapes.
- **Edit Shared** (`shared`) — Checkbox. On for the first module to claim a shared bone, off when another module already has it. On lets this module restyle that bone and off leaves it as it is.
- **Mirror Rigging** (`mirror`) — Checkbox; on when adding if every selected bone has an opposite side, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`. Builds the other side as its own list entry. An origin with no side in its name is shared by both. Settings stay matched and either side can be edited. With no opposite side it adds nothing. Turning it off removes the other side's bones.

### Naming

Prefixes added to bone names.

- **Target** — default `ckt_`. Prefix for the single curl control. Required.
- **Forward** — default empty. Prefix for the chain bones. Leave it empty, see Limitations.
- **Stretch** — default `skc_`. Prefix for the stretch mechanism bones. Required.
- **Offset** — default `cko_`. Prefix for the offset mechanism bones. Required.

### Colors

- **Origin** — default 13 - Theme Color Set. Inactive, see Limitations.
- **Target** — default 01 - Theme Color Set. Colors the single curl control.
- **Forward** — default 13 - Theme Color Set. Colors the chain bones. Also colors the origin and ending.
- **Stretch** — default 10 - Theme Color Set. Colors the stretch mechanism bones.
- **Offset** — default 10 - Theme Color Set. Colors the offset mechanism bones.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Origin** — default Strips Single, translation 0, 0.5, 0. Used by the origin bone.
- **Target** — default Strips Single, scale 1.5. Used by the single curl control.
- **Forward** — default Strips Single, translation 0, 0.5, 0. Used by the chain bones.
- **Stretch** — default Dash Half. Used by the stretch mechanism bones.
- **Offset** — default Ball Half, scale 0.5. Used by the offset mechanism bones.

## Controls

Each chain bone has its own dropdown, **First**, **Second** and so on:

- **Rotation Influence** — How much of the control's rotation reaches this bone.
- **X**, **Y** and **Z** — Which axes of it reach this bone. They edit the bone directly, so a rebuild puts them back to the toggles in **Settings**.
- **Location Influence** — Off by default. Lets the bone move as well as rotate.

## Limitations

- **Some Colors rows change nothing.** **Origin** takes its color from **Forward**. Use those rows instead.
- **A failed setup only reports to the system console.** With fewer than two bones selected, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **A Forward prefix breaks this module, so leave it empty.** Any prefix makes the rebuild fail partway with a `KeyError`, leaves the armature in Edit mode and stops later setting changes from rebuilding the module. Clearing it again doesn't recover the module. In testing, going back to Pose mode, clearing it and running Rebuild Rigging took this module from 11 bones to 14, with stale `zz_` bones left behind and the origin only under its prefixed name. Undo straight away if it happens, though that recovery couldn't be tested.
- **Axis is only filled in for the first module.** After that the last value is remembered for this type, even on a different chain, and a chosen axis always beats the chain's bend. In testing a saved -Z carried straight over, so check **Axis** on each new chain.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 11 bones to 0, and fixing it brought all 11 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Nothing checks that bones are connected.** A selection of unconnected bones built without complaint in testing, as `Curl (head - tail_01)`, so check your selection.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Turning Mirror Rigging off leaves a dead entry.** The other side's bones go, 22 bones down to 11 in testing, but its entry stays in the list with settings and no bones. Select it and press **-**.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 11 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.
- There's no snapping, because there's no IK.
- Each finger is a module of its own.

## Related

### Related Modules

- [Opposable Arm]({% link docs/rapid_rigging/opposable_arm.md %}): the hand fingers usually attach to.
- [Spline Chain]({% link docs/rapid_rigging/spline_chain.md %}) and [Scalar Chain]({% link docs/rapid_rigging/scalar_chain.md %}): chains you position rather than curl.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
