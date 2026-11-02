---
title: Custom Bones
parent: Rapid Rigging
nav_order: 9
permalink: /rapid_rigging/custom_bones/
---

# Custom Bones

Copies the selected bones onto the Rigging armature as plain controls, with no chain logic or extra constraints. This is the fallback when no other module fits.

{% include media/youtube.html title="Adding Custom Bones: selecting a few loose bones on the Oriented armature, adding the module, posing the new controls, then changing Edit Shared and the Forward color" %}

## Overview

Use this for loose bones that just need something to grab, such as a jaw, a prop bone or a helper. Each selected bone gets a control in the same position and at the same length, and the bone then follows it.

Controls are parented to whichever rigged bone is nearest above them in the hierarchy, and any rigged bones below them are parented to them. Only a [Twist Chain]({% link docs/rapid_rigging/twist_chain.md %}) is meant to attach to these bones.

## UI Location

Modules are listed in `Properties > Armature > Rigging Modules`, which shows when an armature from the character's hierarchy is active and selected. Their settings only show in Pose mode, in the **Settings**, **Naming**, **Colors** and **Shapes** subpanels under the list.

You add one from `Pose > Add Rigging`, or `Shift + A` in Pose mode. The **+** beside the list adds an empty entry instead, and you pick its type from the **Rigging** dropdown.

This module has nothing in the **Controls** subpanel. You pose its bones directly.

## Adding the Module

1. Make the Oriented armature active and enter Pose mode. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates it if the character doesn't have one.
2. Select one or more bones.
3. Open `Pose > Add Rigging` and choose **Custom Bones**.

One selected bone is the hard minimum and there's no maximum. Every selected bone is equal, with no active bone, chain or order to it.

See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}) for the operator itself. The first module creates `<name>_Rigging` above the Oriented armature, and that armature is active afterwards, with the Oriented one still in Pose mode. Modules only read bones selected on the Oriented armature, so keep selecting there.

## Module Settings

Every change here rebuilds the module straight away.

The Naming, Colors and Shapes values are remembered for the next module of this type, in any file. Bones aren't.

### Settings

- **First**, **Second** and so on (`suffices`) — Bone name; one row per selected bone. Required.
- **Edit Shared** (`shared`) — Checkbox. On unless another module already has one of these bones. On lets this module restyle them, and off leaves existing ones as they are.

There's no mirroring on this module, so add each side yourself.

### Naming

A prefix added to bone names.

- **Forward** — default empty. Prefix for the copied bones.

### Colors

- **Forward** — default 13 - Theme Color Set. Colors the copied bones.

### Shapes

Each row has a dropdown on its right that switches the row between **Shape**, **Translation**, **Rotation** and **Scale**. Translation is multiplied by the bone's length. Rotation starts at zero on every row.

- **Forward** — default Ball Full, scale 0.5. Used by the copied bones.

## Limitations

- **A failed setup only reports to the system console.** With nothing selected, the module doesn't build. The Rigging armature is still created, and the entry stays in the list with its **Rigging** dropdown on `Select a module...`. To fix it, select the right bones and pick the type from that dropdown, or press **-** to drop the entry.
- **An invalid value removes the module's bones.** A required row left blank, a repeated name, or a bone name that doesn't exist removes every bone in the module until you fix it, and then it rebuilds by itself. In testing a wrong bone name on this module went from 2 bones to 0, and fixing it brought all 2 back. A blank or repeated row turns red, but a bone name that doesn't exist doesn't, so disappearing controls may be the only sign.
- **Adding the same bones twice isn't stopped.** It builds a second list entry with the same name as the first, with no warning, so check your selection.
- **Don't change the Rigging dropdown on a built module.** It relabels the module and swaps the settings shown without rebuilding. In testing all 2 bones stayed as they were while the panel showed another module's settings. To change type, choose `Select a module...`, which removes the module, and removes the Rigging armature if it was the last one, then add the new one.
- There's no mirroring, no snapping and nothing in **Controls**.
- Its list name includes every bone, like `Custom (head, jaw)`, so it can get long.

## Related

### Related Modules

- [Twist Chain]({% link docs/rapid_rigging/twist_chain.md %}): the one module meant to attach to these.
- [Root Controls]({% link docs/rapid_rigging/root_controls.md %}): for the character's root.

### Related Operators

- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %})
