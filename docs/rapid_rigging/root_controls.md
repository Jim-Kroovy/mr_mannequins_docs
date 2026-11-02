---
title: Root Controls
parent: Rapid Rigging
nav_order: 1
permalink: /rapid_rigging/root_controls/
---

# Root Controls

Adds the character's root control and, optionally, makes other bones follow it through a constraint you can turn down, so root motion can be blended with animation already on those bones.

{% include media/youtube.html title="Adding Root Controls: making the root bone active on the Oriented armature, selecting a pelvis as a follower, adding the module from Pose > Add Rigging, then using Root Influence and the Lock settings in the Controls panel" %}

## Overview

Every character with a root bone can use this, whatever its anatomy. It's usually the first module added, and chains can use its bone as their **Root** row or origin.

It creates a copy of the root bone that's aligned to the armature, with its tail along +Y and sized from the armature's own width or depth. Each follower gets an unparented copy, with a **Root Transform** constraint to that control, sized to span the bone's own descendants.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

Once built, its controls are in the **Controls** subpanel. With the Rigging armature active in Pose mode, they're also at `3D Viewport > Sidebar > Animation > Controls` for whichever module owns the active bone.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Make the root bone active. It doesn't have to be selected.
3. Select any bones that should follow it, such as the pelvis. They're optional.
4. Open `Pose > Add Rigging` and choose **Root Controls**.

The only requirement is an active bone. Every other selected bone becomes a follower, so don't leave extras selected.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values are remembered for the next module of this type, in any file. Bones aren't.

### Settings

- **Root** (`suffices`) — Bone name; the active bone. Required. The bone this control is made for.
- **First**, **Second** and so on (`suffices`) — Bone name; one row per follower. Required. You can repoint a row, but you can't add more here.

There's no mirroring, and no **Edit Shared**, because chains never restyle a root control.

### Naming

Prefixes added to bone names. Neither is required.

- **Root** — default empty. Prefix for the root control.
- **Child** — default empty. Prefix for the follower bones.

### Colors

- **Root** — default 01 - Theme Color Set. Colors the root control. Only used once the **Root** row has a bone.
- **Child** — default 01 - Theme Color Set. Colors the follower bones.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Root** — default Compass Full. Used by the root control.
- **Child** — default Circle Full, scale 1.5. Used by the follower bones.

## Controls

- **Lock Location**, **Lock Rotation** and **Lock Scale** — Off by default. Turning one up locks that channel on the root control.
- **Root Influence** — On by default, shown once there's a follower. How much every follower follows the root, all driven from this one slider.

## Limitations

- **A failed setup only reports to the system console.** With no active bone, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 2 bones to 0, and fixing it brought all 2 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 2 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.

## Related

### Related Modules

- [Spline Chain]({% link docs/rapid_rigging/spline_chain.md %}), [Opposable Arm]({% link docs/rapid_rigging/opposable_arm.md %}), [Plantigrade Leg]({% link docs/rapid_rigging/plantigrade_leg.md %}) and [Digitigrade Leg]({% link docs/rapid_rigging/digitigrade_leg.md %}): chains that can sit on this control.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
